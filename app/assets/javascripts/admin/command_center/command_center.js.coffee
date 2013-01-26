window.CommandCenter =
  init: ->
    self = this
    $(".colorbox").colorbox({height: "600px", width: "1000px", iframe: true})
    $(".correct").click ->
      team_id = $(this).attr("team_id")
      wager = $("#wager-" + team_id).val()
      if (!wager)
        alert "Please enter a wager"
        return false
      $("#correct-" + team_id).val(true)
    $(".wrong").click ->
      team_id = $(this).attr("team_id")
      wager = $("#wager-" + team_id).val()
      if (!wager)
        alert "Please enter a wager"
        return false
      $("#correct-" + team_id).val(false)