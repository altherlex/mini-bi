class Universe < ActiveRecord::Base
  attr_accessible :description, :name, :sql
  has_many :columns, :dependent => :destroy, :order =>:id
  accepts_nested_attributes_for :columns, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  #todo: possibilitar 'select *'
  COMANDOS_SQL_INVALIDOS = 
    [/SELECT *\*/,/INSERT *INTO/, /UPDATE/, /DELETE *FROM/, /CREATE *TABLE/, /ALTER *TABLE/, /DROP *TABLE/, /DESCRIBE *TABLE/, /COMMIT/, /ROLLBACK/]
  COMANDOS_SQL_VALIDOS = [/SELECT.*FROM/]

  DIVISER_COLUMNS = ','
  SELECT='SELECT'
  FROM = 'FROM'
  # Compatible with databases
  LIMIT = Universe.limit(1).to_sql.split('universes').last
  # Reserves words for sql text
  MARK_GROUP = '[GROUP BY]'
  
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

  def load_query(select_cols=nil)
    return unless self.valid?
    mount = [SELECT, mount_select(select_cols), body, mount_where]
    # set group by
    if sql.include?(MARK_GROUP)
      mount = mount.join(' ')
      mount = mount.gsub(MARK_GROUP, mount_group_by(select_cols))
    else
      mount <<  mount_group_by(select_cols)
      mount = mount.join(' ')
    end
    return mount
  end

  def executable?
    ActiveRecord::Base.connection.execute load_query+LIMIT
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
    _cols = self.columns if _cols.nil? or _cols.empty?
    r=cols.select{|i| _cols.map(&:name).join(' ').include? Column.clean(i) }.join(DIVISER_COLUMNS+' ')
    #Aggregate Columns are left side
    r.split(DIVISER_COLUMNS).sort{|i| i<=>Column.alias_name(i)}.join(DIVISER_COLUMNS+' ').strip
  end
  def mount_where()
    return '' # TODO
  end
  def mount_group_by(_cols=self.columns)
    _cols = self.columns if _cols.nil? or _cols.empty?
    "GROUP BY #{_cols.select(&:dimension?).map(&:name).join(', ')}" if columns.metric.present?
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
