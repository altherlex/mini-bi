class Panel < ActiveRecord::Base
  attr_accessible :description, :layout, :name, :private
  has_many :widgets
end
