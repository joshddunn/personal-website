# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

copyLink = (link) ->
  copy = $("#copy")
  copy.val(link)
  copy.select()
  document.execCommand("copy")

  return 0

root = exports ? this
root.copyLink = copyLink

copyFormatted = (link) ->
  copy = $("#copy")
  copy.val("<image src=\"" + link + "\" style=\"width:100%\">")
  copy.select()
  document.execCommand("copy")

  return 0

root = exports ? this
root.copyFormatted = copyFormatted

$ ->
  ready = ->
    $(".collapse").on "click", (e) ->
      item = $("." + $(this).data("which"))
      item.toggle()

      icon = $(this).children('i')
      icon.toggleClass('fa-chevron-circle-right')
      icon.toggleClass('fa-chevron-circle-down')

      return false

  $(document).on('turbolinks:load', ready)
