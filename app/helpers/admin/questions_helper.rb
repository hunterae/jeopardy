module Admin::QuestionsHelper
  def final_jeopardy_question
    @final_jeopardy_question ||= Question.find_by_mode(Game::FINAL_JEOPARDY)
  end
end
