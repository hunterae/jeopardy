window.Board =
  init: ->
    self = this
    self.board = $(".board")
    $(window).resize ->
      self.resizeBoard()

    self.resizeBoard()

    pusher = new Pusher("1c38d720f7e356345bbb")
    channel = pusher.subscribe("jeopardy")

    channel.bind "update-game", (data) ->
      self.playSoundEffect("http://soundfxnow.com/soundfx/Jeopardy-boardfill.mp3")
      if data.mode == "double"
        $("#single").hide()
        $("#double").show()

    channel.bind "start-game", (data) ->
      self.playSoundEffect("http://soundfxnow.com/soundfx/Jeopardy-boardfill.mp3")
      $("#title-image").hide()
      $("#dashboard").show()

    channel.bind "out-of-time", (data) ->
      self.playSoundEffect("http://soundfxnow.com/soundfx/Jeopardy-time.mp3")

    channel.bind "play-game-music", (data) ->
      self.playSoundEffect("http://home.arcor.de/eilertzj/Blogg/Profil/dumdidum.mp3")

    channel.bind "play-game-timer", (data) ->
      self.playSoundEffect("http://www.soundboard.com/mediafiles/MTMxOTQ5Nzc4MTMxOTcx_FJGXeSZhwls.mp3")

    channel.bind "end-game", (data) ->
      window.location = "/winner"

    channel.bind "show-question", (data) ->
      if data.daily_double
        self.playSoundEffect("http://soundfxnow.com/soundfx/Jeopardy-daily2x.mp3")
        $.colorbox
          href: "/assets/daily_double.jpg"
          open: true
      else
        $.colorbox
          html: '<div id="question">' + data.text + '</div>'
          open: true

    channel.bind "show-answer", (data) ->
      $("#question-" + data.id).html("")
      if data.correct_answer == true
        self.playSoundEffect("http://soundfxnow.com/soundfx/GameshowBellDing2.mp3")
        $("#question").append("<br><br><div class='alert alert-success'>" + data.answer + "<br><br>" + data.team.name + " now has $" + data.team.points + "</div>")
      else
        self.playSoundEffect("http://soundfxnow.com/soundfx/Buzzer2.mp3")
        $("#question").append("<br><br><div class='alert alert-error'>Sorry, the correct question was: " + data.answer + "<br><br>" + data.team.name + " now has $" + data.team.points + "</div>")
      self.updatePoints team for team in data.teams

    channel.bind "close-question", (data) ->
      $.colorbox.close()

    channel.bind "show-topic", (data) ->
      $("#topic-" + data.id).show();

  resizeBoard: ->
    $(".board").css "height", (($(window).height() - 120) + "px")

  updatePoints: (team) ->
    $("#team-" + team.id + "-points").html(team.points + " points")

  playSoundEffect: (url) ->
    $("body").append('<embed height="0" width="0" src="' + url + '">')
    