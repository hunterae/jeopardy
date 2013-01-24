class Admin::CommandCenter::CommandCenterController < ApplicationController
  def index
    @teams = Team.order("teams.order asc")
  end
end
