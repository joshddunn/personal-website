$ ->
  $("#no-screenshots").hide()
  $("#screenshots").append("<%= escape_javascript(render 'screenshots/link', screenshot: @screenshot) %>")
  $("#screenshot_image").val('')
  $("#screenshot-errors").html('')
