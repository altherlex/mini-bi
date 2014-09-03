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
    cols = []
    cols =  Column.find(config) if !config.nil? or !config.empty?
    @d_cols = cols.select(&:dimension?) if !config.nil? or !config.empty?
    @m_cols = cols.select(&:metric?) if !config.nil? or !config.empty?
  rescue 
    puts '*'*50
    puts 'erro'
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
  
  def select_cols
    ((self.d_cols||@d_cols||[])+(self.m_cols||@m_cols||[]))
  end

  def d_cols=(values)
    @d_cols = values.select(&:present?)
  end
  def m_cols=(values)
    @m_cols = values.select(&:present?)
  end

  private
  before_save do |r| 
    r[:config] = select_cols.to_yaml
  end
end
