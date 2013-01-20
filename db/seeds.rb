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

Team.create!(:name => "Dan Quayle", :order => 1, :quote => "Potatoe")
Team.create!(:name => "Marion Berry", :order => 2, :quote => "[She] set me up")
Team.create!(:name => "Bill Clinton", :order => 3, :quote => "Depends on what your definition of is is")
Team.create!(:name => "Johnny Cochran", :order => 4, :quote => "If the glove don't fit, you must acquit")
Team.create!(:name => "George H Bush", :order => 5, :quote => "Read my lips: no new taxes")
Team.create!(:name => "Ross Perot", :order => 6)
Team.create!(:name => "Bob Dole", :order => 7)
Team.create!(:name => "Al Gore", :order => 8)
Team.create!(:name => "Amy Fisher", :order => 9)
Team.create!(:name => "Nelson Mandela", :order => 10)
Team.create!(:name => "Tupac Shakur", :order => 11)
Team.create!(:name => "Dr. Kevorkian", :order => 12, :quote => "Let's hope you feel better now")

9.times {|i| Team.create!(:name => "Team #{10 + i}", :order => 10 + i)}
