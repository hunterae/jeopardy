class Game < ActiveRecord::Base
  attr_accessible :started, :mode

  SINGLE_JEOPARDY = "single"
  DOUBLE_JEOPARDY = "double"
  FINAL_JEOPARDY = "final"
end
