# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#file_button").on "click", ->
    $("#file_picker").click() # forwards the click event to the hidden file input
  $("#file_picker").on "change", ->
    selected_file = $("#file_picker").get(0).files[0]
    reader = new FileReader()
    reader.onload = (event) ->
      feed_text = event.target.result # reads the file, assigns the text to this variable
      $("#feed_text").val(feed_text) # inserts the text into a hidden textarea
      # $(".new_feedlist").submit() # submits the form
    reader.readAsText(selected_file) if selected_file.name.match(/\.xml$|\.opml/i) # dont want to read non-xml files