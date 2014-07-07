gulp = require "gulp"
nodemon = require "gulp-nodemon"

gulp.task "default", ->
  nodemon {script: "index.coffee", ext: "html coffee js"}

gulp.task "casper", ->
	nodemon {script: "tests/regression/launch.coffee", ext: "html coffee js"}