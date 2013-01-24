module BoardHelper
  def topics_with_questions(mode=nil)
    if mode
      @topics_with_questions = Topic.order("topics.order").includes(:questions).where(["questions.mode = ?", mode])
    else
      @topics_with_questions ||= Topic.order("topics.order").includes(:questions).where(["questions.mode = ?", game.mode])
    end
  end
end
