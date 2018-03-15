$ ->
  $("#screenshot_<%= @screenshot.id %>").remove()
  $("#no-screenshots").show() if $("#screenshots").children().length == 0
