class BoardController < ApplicationController
  def show
    @teams = Team.order("teams.order asc")
    @top_teams = Team.top_teams
  end
end
