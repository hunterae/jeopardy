class Admin::CommandCenter::QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @teams = Team.order("teams.order asc")
    Pusher['jeopardy'].trigger('show-question', {:id => @question.id, :text => @question.text, :daily_double => params[:show_question] ? false : @question.daily_double?})
  end

  def destroy
    Pusher['jeopardy'].trigger('close-question', {})
    render :nothing => true
  end
end
