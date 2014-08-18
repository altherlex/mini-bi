class Universe < ActiveRecord::Base
  attr_accessible :desc, :name, :sql
  has_many :columns, :dependent => :destroy
  accepts_nested_attributes_for :columns, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true

  COMANDOS_SQL_INVALIDOS = 
    [/SELECT *\*/,/INSERT *INTO/, /UPDATE/, /DELETE *FROM/, /CREATE *TABLE/, /ALTER *TABLE/, /DROP *TABLE/, /DESCRIBE *TABLE/, /COMMIT/, /ROLLBACK/]
  COMANDOS_SQL_VALIDOS = [/SELECT.*FROM/]

  FUNCOES_AGREGACAO =
    [/SUM\([\w|.|\s]+\)/i, /COUNT\([\w|.|\s]+\)/i, /AVG\([\w|.|\s]+\)/i, /MIN\([\w|.|\s]+\)/i, /MAX\([\w|.|\s]+\)/i]
  
  validates :name, presence: true
  validates_uniqueness_of :name
  validates :sql, presence: true
  
  validate do |record|
    return unless sql.present?
    txt_sql_normatizado = sql.upcase.squish.clone
    invalido = COMANDOS_SQL_INVALIDOS.select{|comando| txt_sql_normatizado =~ comando }.size > 0
    errors.add(:sql, :invalido) if invalido
    # Sql invalido
    errors.add(:sql, :select_normalizado) unless clausule_select_valid?
    #SQL deve conter as palavras SELECT e FROM
    invalido = COMANDOS_SQL_VALIDOS.select{|comando| txt_sql_normatizado =~ comando }.empty?
    errors.add(:sql, :sql_padrao) if invalido
  end
  after_validation do |record|
    if errors.count.zero?
    # deve ser alterado no validacao pois há selects sem []
    # deve ser alterado o sql antes de validar
      record.clausule_select_normalized!
    # Clausula select deve conter as colunas entre chaves '['']'
      errors.add(:sql, :select_config) unless clausule_select_normalized?
    end
  end

  def clausule_select_valid?()
    txt_sql_normatizado = sql.to_s.upcase.squish.clone
    invalido = COMANDOS_SQL_INVALIDOS.select{|comando| txt_sql_normatizado =~ comando }.size > 0
    return !invalido
  end
 
  def clausule_select_normalized!
    unless self.clausule_select_normalized?
      arr_value = self.sql.upcase.split('FROM')
      head = arr_value.first.gsub!(',',';')
      body = arr_value[1..-1]
      self.sql= [head.insert(head.index('SELECT ')+7, '['), ']', 'FROM', body].join
    end  
  end

  def clausule_select_normalized?
    if self.sql.present? and clausule_select_valid?
      select_part = self.sql.upcase.split('FROM').first.squish
      result = (select_part.include?('[') and select_part.include?(']'))
    else
      result = true
    end
    return result
  end

  def sql_columns
    si, sf = self.sql.index('[')+1, self.sql.index(']')
    self.sql[si, sf-si].strip.squish.split(';').map(&:strip)
  end 

  private
  before_create do |record|
    # deve inserir as colunas do select em columns
    sql_columns.each{|col| record.columns.build(nme_termo:col)}
    #sql_columns.each{|col| Column.create(nme_termo:col, universe_id:record.id)} #if record.valid?}
  end
end
