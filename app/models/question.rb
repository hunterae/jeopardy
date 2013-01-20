class Question < ActiveRecord::Base
  attr_accessible :text, :answer, :value, :daily_double, :answered

  belongs_to :topic

  def set_as_daily_double
    Question.transaction do
      Question.update_all(:daily_double => false)
      self.daily_double = true
      self.save!
    end
  end
end
