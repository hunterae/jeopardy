module Admin::TopicsHelper
  def ordered_topics_for_mode(mode)
    @topics = Topic.order("topics.order asc").where(:mode => mode)
  end
end
