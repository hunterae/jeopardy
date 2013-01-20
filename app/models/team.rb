class Team < ActiveRecord::Base
  attr_accessible :name, :order, :points, :quote
end
