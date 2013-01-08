class Admin::CommandCenter::QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
    Pusher['jeopardy'].trigger('show-question', {:id => @question.id, :text => @question.text})
  end
end
