class AddModeToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :mode, :string
  end
end
