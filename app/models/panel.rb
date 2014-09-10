class Panel < ActiveRecord::Base
  attr_accessible :description, :layout, :name, :private
  has_many :widgets

  # TODO See all publics and yours privates
  def all
    self.all
  end
end
