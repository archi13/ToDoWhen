gulp = require "gulp"
nodemon = require "gulp-nodemon"
sass = require "gulp-ruby-sass"
del = require "del"
sequence = require "run-sequence"
coffee = require "gulp-coffee"


gulp.task "casper", ->
	nodemon {script: "tests/regression/launch.coffee", ext: "html coffee js jade"}


gulp.task "clean", ->
	del "build", ->

gulp.task "bower_src_copy", ["clean"], ->
	gulp.src "./src/public/bower/**/*.*", {base: "./src/public/bower"}
		.pipe gulp.dest "build/bower"

gulp.task "sass_compile", ["clean"], ->
    gulp.src "src/public/sass/**/*.sass"
        .pipe sass()
        .pipe gulp.dest "build/css"

gulp.task "coffee_compile", ["clean"], ->
	gulp.src "./src/public/**/*.coffee"
		.pipe coffee()
		.pipe gulp.dest "./build/js"

gulp.task "express", ["clean"], ->
	nodemon {script: "index.coffee", ext: "html coffee js jade"}

gulp.task "watch_sass", ["clean"], ->
	gulp.watch "src/public/sass/*.sass", ["sass"]


gulp.task 'default', ["clean", "bower_src_copy", "sass_compile", "coffee_compile", "express", "watch_sass"], ->
