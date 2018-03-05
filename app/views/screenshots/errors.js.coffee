$ ->
  $("#screenshot-errors").append("<%= escape_javascript(render 'shared/error_messages', object: @screenshot) %>")
