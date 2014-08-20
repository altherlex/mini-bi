class Widget < ActiveRecord::Base
  attr_accessible :panel_id, :pattern, :subtitle, :title, :universe_id
  belongs_to :universe
  belongs_to :panel
  has_many :columns, through: :universe

  validates :universe_id, presence: true
  validates :panel_id, presence: true
  validates :pattern, presence: true
end
