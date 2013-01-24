class BoardController < ApplicationController
  def show
    @teams = Team.order("teams.order asc")
  end
end
