# some jquery to help upload the file
# when a file is picked, it reads the file and inserts the text into a hidden textarea
# which comes through as a param
# there's gotta be a better way to do this, right?

# ajaxOptions =
#   complete: onRequestCompleted

# $.ajaxSetup ajaxOptions

# onRequestCompleted = (xhr, textStatus) ->
#   console.log xhr
#   console.log xhr.status
#   console.log xhr.getResponseHeader
#   console.log xhr.getResponseHeader "Location"

puts = (str) -> console.log str
$(document).ready ->
  $("#file_button").on "click", ->
    $("#file_picker").click() # forwards the click event to the hidden file input
  $("#file_picker").on "change", ->
    selected_file = $("#file_picker").get(0).files[0]
    reader = new FileReader()
    reader.onload = (event) ->
      feed_text = event.target.result # reads the file, assigns the text to this variable
      $("#feed_text").val(feed_text) # inserts the text into a hidden textarea
      $("#file_form").submit() # submits the form
    reader.readAsText(selected_file) if selected_file.name.match(/\.xml$|\.opml/i) # dont want to read non-xml files
  $(".folder").on "click", ->
    $(this).next().toggle 'fast' # animates to show/hide the feeds in this folder
    $(this).children().toggle() # toggles the little arrow's direction
