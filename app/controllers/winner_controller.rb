class WinnerController < ApplicationController
  def show
    teams = Team.order("points desc")
    @winning_points = teams.first.points
    @winning_teams = teams.select {|team| team.points == @winning_points }
  end
end
