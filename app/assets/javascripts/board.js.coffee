window.Board =
  init: ->
    self = this
    self.board = $("#board")
    self.teams = $("#teams")
    $(window).resize ->
      self.resizeBoard()

    self.resizeBoard()

    pusher = new Pusher("1c38d720f7e356345bbb")
    channel = pusher.subscribe("jeopardy")

    channel.bind "start-game", (data) ->
      $("#title-image").hide()
      self.board.show()
      self.teams.show()

    channel.bind "show-question", (data) ->
      $.colorbox
        html: '<div id="question">' + data.text + '</div>'
        open: true

    channel.bind "show-answer", (data) ->
      if data.correct_answer == "true"
        $("#question").html(data.answer)
      else
        $("#question").append("<br><br><div class='alert alert-error'>Sorry, the correct answer was: " + data.answer + "</div>")

    channel.bind "show-topic", (data) ->
      $("#topic-" + data.id).show();

  resizeBoard: ->
    this.board.css "height", (($(window).height() - 50) + "px")