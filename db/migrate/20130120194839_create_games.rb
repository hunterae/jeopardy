class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :started, :default => false
      t.string :mode, :default => "single"
      t.timestamps
    end
    Game.create!
  end
end
