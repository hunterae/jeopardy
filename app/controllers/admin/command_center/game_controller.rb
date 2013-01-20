class Admin::CommandCenter::GameController < ApplicationController
  def create
    Question.update_all(:answered => false)
    Team.update_all(:points => 0)
    game.update_attributes(:started => true, :mode => Game::SINGLE_JEOPARDY)
    Pusher['jeopardy'].trigger('start-game', {})
    redirect_to admin_command_center_root_path
  end
  
  def play_game_music
    Pusher['jeopardy'].trigger('play-game-music', {})
    redirect_to admin_command_center_root_path
  end

  def destroy
    Question.update_all(:answered => false)
    game.update_attributes(:started => false, :mode => Game::SINGLE_JEOPARDY)
    Pusher['jeopardy'].trigger('end-game', {})
    redirect_to admin_command_center_root_path
  end
end
