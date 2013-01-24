class AddOtherAnswersToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :other_answers, :text
  end
end
