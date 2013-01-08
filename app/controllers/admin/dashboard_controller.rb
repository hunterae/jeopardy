class Admin::DashboardController < ApplicationController
  def show
    @topics = Topic.order("topics.order").includes(:questions)
    @teams = Team.all
  end

  def show_topic
    Pusher['jeopardy'].trigger('show-topic', {:id => params[:id]})
    redirect_to admin_dashboard_path
  end
end
