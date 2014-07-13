gulp = require "gulp"
nodemon = require "gulp-nodemon"
sass = require "gulp-ruby-sass"
del = require "del"
coffee = require "gulp-coffee"


gulp.task "casper", ->
	nodemon {script: "tests/regression/launch.coffee", ext: "html coffee js jade"}


gulp.task "clean_build", ->
	del "build", ->
		gulp.start "bower_src_copy", "img_copy", "sass_compile", "coffee_compile", "watch_sass", "watch_coffee", "express"

gulp.task "bower_src_copy", ->
	gulp.src "./bower/**/*.*", {base: "./bower"}
		.pipe gulp.dest "build/js/bower"

gulp.task "img_copy", ->
	gulp.src "./src/public/img/**/*.*", {base: "./src/public/img"}
		.pipe gulp.dest "build/img"

gulp.task "sass_compile", ->
    gulp.src "src/public/sass/**/*.sass"
        .pipe sass()
        .pipe gulp.dest "build/css"

gulp.task "coffee_compile", ->
	gulp.src "./src/public/**/*.coffee"
		.pipe coffee()
		.pipe gulp.dest "./build/js"

gulp.task "express", ->
	nodemon {script: "index.coffee", ext: "html coffee js jade"}

gulp.task "watch_sass", ->
	gulp.watch "src/public/sass/*.sass", ["sass_compile"]

gulp.task "watch_coffee", ->
	gulp.watch "src/public/**/*.coffee", ["coffee_compile"]


gulp.task "default", ["clean_build"], ->
