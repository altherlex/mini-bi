class Widget < ActiveRecord::Base
  attr_accessible :d_cols, :m_cols, :panel_id, :pattern, :subtitle, :title, :universe_id, :config
  attr_accessor :d_cols, :m_cols

  belongs_to :universe
  belongs_to :panel
  has_many :columns, through: :universe

  validates :universe_id, presence: true
  validates :panel_id, presence: true
  validates :pattern, presence: true

  after_find :after_find
  def after_find
    @d_cols = cols.select(&:dimension?)
    @m_cols = cols.select(&:metric?)
  end
 
  def crude_config
    self[:config]
  end

  def config
    unless self[:config].nil?||self[:config].empty?
      YAML.load(self[:config])
    else
      []
    end
  end

  #like Universe TODO select, where and group_by specific
  def load_query
    universe.load_query(select_cols)
  end
  alias_method :query, :load_query

  def execute
    Widget.find_by_sql load_query
  end
  def execute_json
    JSON.parse(execute.to_json)
  end
  def pie?
    pattern=='pie'
  end
  
  def select_cols
    ((self.d_cols||@d_cols||[])+(self.m_cols||@m_cols||[]))
  end
#  alias_method :cols, :select_cols

  def cols(values=self.config)
    unless values.nil?
      Column.find values.select(&:present?)
    else
      []
    end
  end
  #alias_method :columns, :cols

  def d_cols=(values)
    @d_cols = cols(values)
    #self.config = [self.config, values].flatten
  end
  def m_cols=(values)
    @m_cols = cols(values)
    #self.config = [self.config, values].flatten
  end

  private
  before_save do |r| 
    r[:config] = select_cols.map(&:id).to_yaml
  end
end
