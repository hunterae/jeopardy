class Question < ActiveRecord::Base
  attr_accessible :text, :answer, :value, :daily_double

  belongs_to :topic
end
