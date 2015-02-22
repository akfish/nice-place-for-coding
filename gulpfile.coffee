path = require 'path'
gulp = require 'gulp'
tap = require 'gulp-tap'
Parser = require 'nice-place-for-coding-parser'

gulp.task 'validate', ->
  parser = new Parser()
  gulp.src "**.md"
    .pipe tap (file) ->
      name = path.basename file.path
      if name == 'README.md'
        return
      console.log "Parsing: #{name}"
      places = parser.parse file.contents.toString 'utf-8'
      console.log "... found #{places.length} places"

gulp.task 'default', ['validate']
