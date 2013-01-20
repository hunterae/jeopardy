class Admin::CommandCenter::GameController < ApplicationController
  def create
    Question.update_all(:answered => false)
    Team.update_all(:points => 0)
    $game_on = true
    Pusher['jeopardy'].trigger('start-game', {})
    redirect_to admin_command_center_root_path
  end

  def destroy
    Question.update_all(:answered => false)
    $game_on = nil
    Pusher['jeopardy'].trigger('end-game', {})
    redirect_to admin_command_center_root_path
  end
end
