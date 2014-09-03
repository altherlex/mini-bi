class Column < ActiveRecord::Base
  attr_accessible :name, :label, :aggregate, :sql_values, :filterable, :mandatory, :tpo_objeto, :txt_apresentacao, :universe_id
  belongs_to :universe

  validates_uniqueness_of :name, scope: [:universe_id], :case_sensitive => false
  validates :name, presence: true  
  validates :label, presence: true  
  validates :universe_id, presence: true  

  FUNCOES_AGREGACAO = [/SUM\([\w|.|*|\s]+\)/i, /COUNT\([\w|.|*|\s]+\)/i, /AVG\([\w|.|*|\s]+\)/i, /MIN\([\w|.|*|\s]+\)/i, /MAX\([\w|.|*|\s]+\)/i]
  METRIC = 'M'
  DIMENSION = 'D'
  
  scope :dim, where(aggregate: DIMENSION)
  scope :metric, where(aggregate: METRIC)

  class << self
    def alias_name(str_col)
      return str_col.split(/\W+/).last
    end 
    alias_method :clean, :alias_name 

    def have_aggregate?(col_name)
      FUNCOES_AGREGACAO.find{|fn| col_name.upcase =~ fn}.present?
    end
    def new_cols(cols=[])
      result = []
      cols.each do |col|
        n = alias_name(col)
        agg = (have_aggregate?(col))? METRIC : DIMENSION
        f = (agg!=METRIC)? true : false
        result << Column.new({name:n, aggregate:agg, filterable:f})
      end
      return result
    end
  end
  
  def metric?
    aggregate==METRIC
  end
  alias_method :aggregate?, :metric?

  def dimension?
    aggregate==DIMENSION
  end

  def name=(value)
    super value.upcase
  end

  private
  before_save do |record|
    if not record.label.present?
      record.label = record.name
    end
  end
end
