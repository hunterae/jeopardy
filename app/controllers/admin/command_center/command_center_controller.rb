class Admin::CommandCenter::CommandCenterController < ApplicationController
  def index
    @topics = Topic.order("topics.order").includes(:questions)
    @teams = Team.order("teams.order asc")
  end
end
