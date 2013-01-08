class Admin::CommandCenter::TopicsController < ApplicationController
  def show
    Pusher['jeopardy'].trigger('show-topic', {:id => params[:id]})
    redirect_to admin_command_center_root_path
  end
end
