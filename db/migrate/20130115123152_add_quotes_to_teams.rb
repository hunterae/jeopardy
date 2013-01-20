class AddQuotesToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :quote, :string
  end
end
