class Admin::TeamsController < ApplicationController
  def index
    @teams = Team.order("teams.order asc")
  end

  def edit
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])
    @team.update_attributes(params[:team])
    redirect_to admin_teams_path
  end

  def move_up
    team = Team.find(params[:id])

    unless team.order == 0
      previous_team = Team.find_by_order(team.order - 1)
      Team.transaction do
        previous_team.update_attributes(:order => team.order)
        team.update_attributes(:order => team.order - 1)
      end
    end
    redirect_to admin_teams_path
  end

  def move_down
    team = Team.find(params[:id])

    unless team.order == Team.count - 1
      next_team = Team.find_by_order(team.order + 1)
      Team.transaction do
        next_team.update_attributes(:order => team.order)
        team.update_attributes(:order => team.order + 1)
      end
    end
    redirect_to admin_teams_path
  end
end