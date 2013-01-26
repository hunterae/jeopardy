class ApplicationController < ActionController::Base
  protect_from_forgery

  def game
    @game ||= Game.first
  end
  helper_method :game

  def game_on?
    game.started?
  end
  helper_method :game_on?

  def single_jeopardy?
    game.mode == Game::SINGLE_JEOPARDY && game_on?
  end
  helper_method :single_jeopardy?

  def double_jeopardy?
    game.mode == Game::DOUBLE_JEOPARDY && game_on?
  end
  helper_method :double_jeopardy?

  def final_jeopardy?
    game.mode == Game::FINAL_JEOPARDY && game_on?
  end
  helper_method :final_jeopardy?
end
