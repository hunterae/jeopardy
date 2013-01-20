class BoardController < ApplicationController
  def show
    @topics = Topic.includes(:questions)
    @teams = Team.order("teams.order asc")
  end
end
