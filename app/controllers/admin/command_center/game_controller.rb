class Admin::CommandCenter::GameController < ApplicationController
  def create
    Question.update_all(:answered => false)
    Team.update_all(:points => 0)
    $game_on = true
    Pusher['jeopardy'].trigger('start-game', {})
    redirect_to admin_command_center_root_path
  end

  def destroy
    $game_on = nil
    redirect_to admin_command_center_root_path
  end
end
