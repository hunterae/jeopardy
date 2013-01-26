class Team < ActiveRecord::Base
  attr_accessor :wager
  attr_accessor :correct
  attr_accessible :name, :order, :points, :quote, :correct, :wager

  def self.top_teams(n=3)
    @top_teams = Team.order("points desc")
    last_place_points = @top_teams[n - 1].points
    last_place_position = n
    (n...@top_teams.length).each do |i|
      break if @top_teams[i].points != last_place_points
      last_place_position = i + 1
    end
    @top_teams.first(last_place_position)
  end
end
