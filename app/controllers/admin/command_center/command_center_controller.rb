class Admin::CommandCenter::CommandCenterController < ApplicationController
  def index
    @teams = Team.order("teams.order asc")
    @top_teams = Team.top_teams
  end
end
