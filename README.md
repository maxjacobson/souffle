# Souffle

(a terrible code name)

Site to upload your Google Reader feeds and share what you read and see what your friends are reading.

## Running

From project root:

* `bundle install`
    * probably only once
    * to get up and running with all the gems needed to work on this
* `compass watch`
    * compiles the SASS, watches for changes
* `coffee -j public/js/app.js -cw assets/coffee/`
    * compiles all coffeescript files in the folder into one js file, watches for changes
* `shotgun web`
    * runs the web app locally at <http://localhost:9393>

## Todos

* add a database so people's feeds will persist and they can share with friends
* allow the removal of feeds that you don't want to share
* add a "cart" where you can add feeds you find on other people's profiles, and it'll generate an xml file for you to import into GR
* explore the possibility of authenticating with google and getting user permission to access their subscriptions w/o them having to export/unzip/upload
* sync back to GR? like, have an "unsubscribe" button...?
* let people write notes to explain why they like something

