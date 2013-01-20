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

Team.create!(:name => "Dan Quayle", :order => 0, :quote => "Potatoe")
Team.create!(:name => "Marion Berry", :order => 1, :quote => "[She] set me up")
Team.create!(:name => "Bill Clinton", :order => 2, :quote => "Depends on what your definition of is is")
Team.create!(:name => "Johnny Cochran", :order => 3, :quote => "If the glove don't fit, you must acquit")
Team.create!(:name => "George H Bush", :order => 4, :quote => "Read my lips: no new taxes")
Team.create!(:name => "Ross Perot", :order => 5, :quote => "Now, wait just a minute")
Team.create!(:name => "Bob Dole", :order => 6, :quote => "That's simply not something Bob Dole does!")
Team.create!(:name => "Al Gore", :order => 7, :quote => "I took the initiative in creating the Internet.")
Team.create!(:name => "Amy Fisher", :order => 8, :quote => "I wanted to do something different, ... I really didn`t give any thought to practicality.")
Team.create!(:name => "Nelson Mandela", :order => 9, :quote => "It is better to lead from behind and to put others in front")
Team.create!(:name => "Tupac Shakur", :order => 10, :quote => "Only God Can Judge Me")
Team.create!(:name => "Dr. Kevorkian", :order => 11, :quote => "Let's hope you feel better now")
Team.create!(:name => "Dolly", :order => 11, :quote => "Baaahhhhhhhh")
Team.create!(:name => "Kurt Cobain", :order => 12, :quote => "I'd rather be hated for who I am, than loved for who I am not. ")
Team.create!(:name => "Tiger Woods", :order => 13, :quote => "As you all know, I'm kind of a perfectionist.")
Team.create!(:name => "Fiona Apple", :order => 14, :quote => "This world is [bull]")
Team.create!(:name => "Michael Jordan", :order => 15, :quote => "Just play. Have fun. Enjoy the game.")
Team.create!(:name => "Matt Stone", :order => 16, :quote => "At this point, we've ripped on everyone.")
Team.create!(:name => "Matt Groening", :order => 17, :quote => "Cartooning is for people who can't quite draw and can't quite write.")

6.times {|i| Team.create!(:name => "Team #{13 + i}", :order => 12 + i)}
