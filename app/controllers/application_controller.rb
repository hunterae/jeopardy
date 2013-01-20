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
    game.mode == Jeopardy::SINGLE_JEOPARDY
  end
  helper_method :single_jeopardy?

  def double_jeopardy?
    game.mode == Jeopardy::DOUBLE_JEOPARDY
  end
  helper_method :double_jeopardy?

  def final_jeopardy?
    game.mode == Jeopardy::FINAL_JEOPARDY
  end
  helper_method :final_jeopardy?
end
