class Admin::CommandCenter::QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    @question.update_attributes(:answered => true)
    @teams = Team.order("teams.order asc")
    Pusher['jeopardy'].trigger('show-question', {:id => @question.id, :text => @question.text, :daily_double => @question.daily_double?})
  end
end
