# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
    @paintIt3 = (element) ->
    $ ->
        $(".seat").click (e) ->
            # console.log(e)
            e.preventDefault()
            alert(" Seat: " + e.target.id+"\r\n Status: Available \r\n Price: $86.50")
            