window.Questions =
  init: ->
    originalClose = parent.$.colorbox.close
    parent.$.colorbox.close = ->
      $.ajax(type: "DELETE", url: window.location)
      parent.$.colorbox.close = originalClose
      originalClose()
  initDailyDouble: ->
    $(".wrong, .correct, #show-question").click ->
      element = $(this)
      wager = $("#wager").val()
      if !wager
        alert "Please enter a wager"
        return false
      element.attr("href", element.attr("href") + "&wager=" + wager)
      true