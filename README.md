# Souffle

(a terrible code name)

<http://souffle.herokuapp.com>

Site to upload your Google Reader feeds and share what you read and see what your friends are reading.

## Requirements

* run `bundle install` to get all of the gems needed for this project
* install [coffeescript][] if you want to work on that

[coffeescript]: http://coffeescript.org

## Running

From project root:

* `compass watch`
    * compiles the SASS, watches for changes
* `coffee -j public/js/app.js -cw assets/coffee/`
    * compiles all coffeescript files in the folder into one js file, watches for changes
* `shotgun web`
    * runs the web app locally at <http://localhost:9393>

## Todos / thoughts / notes

* add a database so people's feeds will persist and they can share with friends
* (should this be a rails app? probably, right?)
* allow the removal of feeds that you don't want to share
* add a "cart" where you can add feeds you find on other people's profiles, and it'll generate an xml file for you to import into GR
* explore the possibility of authenticating with google and getting user permission to access their subscriptions w/o them having to export/unzip/upload
* sync back to GR? like, have an "unsubscribe" button...?
* let people write notes to explain why they like something
* find people who subscribe to the same sites that you do
    * so, if you're looking at a feed, it'll give a list of people who read it
    * also: it'll share people who you have a lot of overlap with