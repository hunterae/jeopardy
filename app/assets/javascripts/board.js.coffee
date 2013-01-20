window.Board =
  init: ->
    self = this
    self.board = $("#board")
    $(window).resize ->
      self.resizeBoard()

    self.resizeBoard()

    pusher = new Pusher("1c38d720f7e356345bbb")
    channel = pusher.subscribe("jeopardy")

    channel.bind "start-game", (data) ->
      $("#title-image").hide()
      $("#dashboard").show()

    channel.bind "end-game", (data) ->
      window.location = "/winner"

    channel.bind "show-question", (data) ->
      $("#question-" + data.id).html("")
      if data.daily_double
        $.colorbox
          href: "/assets/daily_double.jpg"
          open: true
      else
        $.colorbox
          html: '<div id="question">' + data.text + '</div>'
          open: true

    channel.bind "show-answer", (data) ->
      if data.correct_answer == "true"
        $("#question").append("<br><br><div class='alert alert-success'>" + data.answer + "<br><br>" + data.team.name + " now has $" + data.team.points + "</div>")
      else
        $("#question").append("<br><br><div class='alert alert-error'>Sorry, the correct question was: " + data.answer + "<br><br>" + data.team.name + " now has $" + data.team.points + "</div>")
      self.updatePoints team for team in data.teams

    channel.bind "close-question", (data) ->
      $.colorbox.close()

    channel.bind "show-topic", (data) ->
      $("#topic-" + data.id).show();

  resizeBoard: ->
    $("#board").css "height", (($(window).height() - 120) + "px")

  updatePoints: (team) ->
    $("#team-" + team.id + "-points").html(team.points + " points")
    