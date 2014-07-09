gulp = require "gulp"
nodemon = require "gulp-nodemon"
sass = require "gulp-ruby-sass"

gulp.task "express", ->
	nodemon {script: "index.coffee", ext: "html coffee js jade"}

gulp.task "casper", ->
	nodemon {script: "tests/regression/launch.coffee", ext: "html coffee js jade"}

gulp.task "sass", ->
    gulp.src "src/sass/*.sass"
        .pipe sass()
        .pipe gulp.dest "build/css"

gulp.task "watch", ->
	gulp.watch "src/sass/*.sass", ["sass"]

gulp.task 'default', ["express", "watch"]