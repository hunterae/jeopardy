require 'csv'

class Topic < ActiveRecord::Base
  attr_accessible :name, :order, :mode
  has_many :questions
  before_create :set_order

  def question_for_value(value)
    questions.detect { |question| question.value == value }
  end

  private
  def set_order
    self.order = Topic.count
  end
end
