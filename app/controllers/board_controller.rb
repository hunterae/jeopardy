class BoardController < ApplicationController
  def show
    @topics = Topic.includes(:questions)
    @teams = Team.all
  end
end
