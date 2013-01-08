class Admin::QuestionsController < ApplicationController
  def trigger_question
    @question = Question.find(params[:id])
    Pusher['jeopardy'].trigger('show-question', {:id => @question.id, :text => @question.text})
  end

  def trigger_answer
    @question = Question.find(params[:id])
    Pusher['jeopardy'].trigger('show-answer', {:answer => @question.answer, :correct_answer => params[:correct_answer]})
    redirect_to admin_dashboard_path
  end
end
