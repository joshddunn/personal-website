# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

copyLink = (link) ->
  copy = $("#copy")
  copy.val(link)
  copy.select()
  document.execCommand("copy")

root = exports ? this
root.copyLink = copyLink
