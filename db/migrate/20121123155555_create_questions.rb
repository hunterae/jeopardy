class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :text
      t.string :answer
      t.integer :value
      t.boolean :daily_double
      t.references :topic
      t.boolean :answered
      t.timestamps
    end
  end
end
