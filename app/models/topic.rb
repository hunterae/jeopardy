class Topic < ActiveRecord::Base
  attr_accessible :name, :order
  has_many :questions

  def question_for_value(value)
    questions.detect { |question| question.value == value }
  end
end
