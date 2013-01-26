class Admin::CommandCenter::TeamsController < ApplicationController
  def update
    @team = Team.find(params[:id])
    points = params[:team][:wager].to_i
    points = points * -1 if params[:team][:correct] == "false"
    @team.points = @team.points + points
    @team.save
    Pusher['jeopardy'].trigger('update-game', :mode => Game::FINAL_JEOPARDY)
    redirect_to admin_command_center_root_path
  end
end
