window.Answers =
  init: (questionId) -> 
    parent.$("#question-" + questionId).html("");
    $("#close-question").click ->
      parent.$.colorbox.close()
      false
    Questions.init()