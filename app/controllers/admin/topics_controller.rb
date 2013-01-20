class Admin::TopicsController < ApplicationController
  def index
    @topics = Topic.order("topics.order asc")
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes(params[:topic])
    redirect_to admin_topics_path
  end

  def move_up
    topic = Topic.find(params[:id])

    unless topic.order == 0
      previous_topic = Topic.find_by_order(topic.order - 1)
      Topic.transaction do
        previous_topic.update_attributes(:order => topic.order)
        topic.update_attributes(:order => topic.order - 1)
      end
    end
    redirect_to admin_topics_path
  end

  def move_down
    topic = Topic.find(params[:id])

    unless topic.order == Topic.count - 1
      next_topic = Topic.find_by_order(topic.order + 1)
      Topic.transaction do
        next_topic.update_attributes(:order => topic.order)
        topic.update_attributes(:order => topic.order + 1)
      end
    end
    redirect_to admin_topics_path
  end
end
