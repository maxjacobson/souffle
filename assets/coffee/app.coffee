# some jquery to help upload the file
# when a file is picked, it reads the file and inserts the text into a hidden textarea
# which comes through as a param
# there's gotta be a better way to do this, right?

$(document).ready ->
  $("#file_button").on "click", ->
    $("#file_picker").click()

  $("#file_picker").on "change", ->
    selected_file = $("#file_picker").get(0).files[0]
    reader = new FileReader()
    reader.onload = (event) ->
      feed_text = event.target.result
      $("#feed_text").val(feed_text)
      $("#file_form").submit()
    reader.readAsText(selected_file) if selected_file.name.match(/\.xml$/)

  $(".folder").on "click", ->
    $(this).children().toggle 'fast'
