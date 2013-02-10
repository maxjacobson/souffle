$(document).ready ->
  $("#file_picker").on "change", ->
    selected_file = $("#file_picker").get(0).files[0]
    reader = new FileReader()
    reader.onload = (event) ->
      feed_text = event.target.result
      $("#feed_text").val(feed_text)
    reader.readAsText(selected_file)