class Admin::QuestionsController < ApplicationController
  before_filter :load_question, :only => [:edit, :update, :set_as_daily_double]

  def index
    @topics = Topic.order("topics.order").includes(:questions)
  end

  def edit
  end

  def update
    @question.update_attributes(params[:question])
    redirect_to admin_questions_path
  end

  def set_as_daily_double
    @question.set_as_daily_double
    redirect_to admin_questions_path
  end
  
  private
  def load_question
    @question = Question.find(params[:id])
  end
end