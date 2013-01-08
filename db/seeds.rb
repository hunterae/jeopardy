Topic.destroy_all
Question.destroy_all
Team.destroy_all

topic1 = Topic.create!(:name => "Topic 1", :order => 0)
topic2 = Topic.create!(:name => "Topic 2", :order => 1)
topic3 = Topic.create!(:name => "Topic 3", :order => 2)
topic4 = Topic.create!(:name => "Topic 4", :order => 3)
topic5 = Topic.create!(:name => "Topic 5", :order => 4)
topic6 = Topic.create!(:name => "Topic 6", :order => 5)

5.times do |i|
  topics = [topic1, topic2, topic3, topic4, topic5, topic6]
  topics.each do |topic|
    topic.questions.create!(:text => "Question for #{topic.name} with value $#{(i + 1) * 100}",
                            :answer => "Answer for #{topic.name} with value $#{(i + 1) * 100}",
                            :value => ((i + 1) * 100))
  end
end

13.times {|i| Team.create!(:name => "Team #{i}")}
