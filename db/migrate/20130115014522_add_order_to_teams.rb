class AddOrderToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :order, :integer
  end
end
