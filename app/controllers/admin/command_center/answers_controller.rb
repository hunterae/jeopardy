class Admin::CommandCenter::AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    Pusher['jeopardy'].trigger('show-answer', {:answer => @question.answer, :correct_answer => params[:correct_answer]})
    redirect_to admin_command_center_root_path
  end
end
