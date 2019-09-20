# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  # alert "page has loaded!"
  @paintIt2 = (element) ->
  # element.style.backgroundColor = "green"
  $ ->
    $("a[data-background]").click (e) ->
      console.log(e)
      alert("you click ed" + e.type)
      # e.preventDefault()

  