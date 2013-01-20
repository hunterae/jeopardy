class BoardController < ApplicationController
  def show
    @topics = Topic.includes(:questions)
    @teams = Team.order("`order` asc")
  end
end
