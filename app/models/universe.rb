class Universe < ActiveRecord::Base
  attr_accessible :description, :name, :sql
  has_many :columns, :dependent => :destroy
  accepts_nested_attributes_for :columns, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  #todo: possibilitar 'select *'
  COMANDOS_SQL_INVALIDOS = 
    [/SELECT *\*/,/INSERT *INTO/, /UPDATE/, /DELETE *FROM/, /CREATE *TABLE/, /ALTER *TABLE/, /DROP *TABLE/, /DESCRIBE *TABLE/, /COMMIT/, /ROLLBACK/]
  COMANDOS_SQL_VALIDOS = [/SELECT.*FROM/]

  FUNCOES_AGREGACAO = [/SUM\([\w|.|\s]+\)/i, /COUNT\([\w|.|\s]+\)/i, /AVG\([\w|.|\s]+\)/i, /MIN\([\w|.|\s]+\)/i, /MAX\([\w|.|\s]+\)/i]
  DIVISER_COLUMNS = ','
  SELECT='SELECT'
  FROM = 'FROM'
  
  validates :name, presence: true
  validates_uniqueness_of :name
  validates :sql, presence: true
  
  validate do |record|
    return unless sql.present?
    txt_sql_normatizado = sql.upcase.squish.clone
    invalido = COMANDOS_SQL_INVALIDOS.select{|comando| txt_sql_normatizado =~ comando }.size > 0
    errors.add(:sql, :invalido) if invalido
    invalido = COMANDOS_SQL_VALIDOS.select{|comando| txt_sql_normatizado =~ comando }.empty?
    errors.add(:sql, :sql_padrao) if invalido
  end

  def load_query
    return unless self.valid?
    [SELECT, mount_select, body, mount_where, mount_group_by].join(' ')
  end

  def executable?
    ActiveRecord::Base.connection.execute load_query+' FETCH FIRST 1 ROW ONLY'
    return true
  rescue
    false  
  end

  def body
    #TODO retirar palavras reservadas: [WHERE], [GROUP_BY], {=VAR}
    return sql.upcase[sql.upcase.index(FROM)..-1] #subquerys
  end
  def head
    return sql.upcase.split(FROM).first.split(SELECT).last.squish
  end
  def mount_select(_cols=self.columns)
    cols.select{|i| _cols.map(&:name).join(' ').include? Column.clean(i) }.join(', ')
  end
  def mount_where()
    return '' # TODO
  end
  def mount_group_by(_cols=self.columns)
    "GROUP BY #{_cols.dim.map(&:name).join(', ')}" if columns.metric.present?
  end

  # todo: varificar se o sql é exequivel
  def cols
    head.split(DIVISER_COLUMNS).map(&:strip)
  end 

  private
  before_create do |record|
    # deve inserir as colunas do select em columns
    record.columns = Column.new_cols(record.cols)
  end
end
