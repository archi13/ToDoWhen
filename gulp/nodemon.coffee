gulp = require "gulp"
nodemon = require "gulp-nodemon"

gulp.task "default", ->
  nodemon {script: "index.coffee", ext: "html coffee js"}