class Admin::CommandCenter::AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @team = Team.find(params[:team_id])
    points = @question.value * (params[:correct_answer] ? 1 : -1)
    @team.update_attributes(:points => @team.points + points)
    @teams = Team.all
    Pusher['jeopardy'].trigger('show-answer', {:answer => @question.answer, :correct_answer => params[:correct_answer], :teams => @teams, :team => @team })
    render :show
  end

  def destroy
    Pusher['jeopardy'].trigger('close-question', {})
    @close_window = true
    render :show
  end
end