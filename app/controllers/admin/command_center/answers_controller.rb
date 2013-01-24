class Admin::CommandCenter::AnswersController < ApplicationController
  def create
    @question = Question.find(params[:question_id])
    @question.update_attributes(:answered => true)
    @team = Team.find(params[:team_id])
    @correct_answer = params[:correct_answer] == "true"
    @points = (params[:wager] || @question.value).to_i * (@correct_answer ? 1 : -1)
    @team.update_attributes(:points => @team.points + @points)
    @teams = Team.all
    Pusher['jeopardy'].trigger('show-answer', {:id => @question.id, :answer => @question.answer, :correct_answer => @correct_answer, :teams => @teams, :team => @team })
    render :show
  end

  def destroy
    Pusher['jeopardy'].trigger('close-question', {})
    render :nothing => true
  end
end