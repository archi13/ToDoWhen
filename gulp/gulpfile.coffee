gulp = require "gulp"
nodemon = require "gulp-nodemon"
sass = require "gulp-ruby-sass"
del = require "del"
coffee = require "gulp-coffee"
jsx = require "gulp-react"
mocha = require "gulp-mocha"
concatCss = require "gulp-concat-css"
header = require "gulp-header"


gulp.task "casper", ->
	nodemon {script: "tests/regression/launch.coffee", ext: "html coffee js jade"}

gulp.task "test", ->
	gulp.src "tests/integration/routing.coffee", {read: false}
		.pipe mocha {reporter: 'spec'}

gulp.task "clean_build", ->
	del "build", ->
		gulp.start ["bower_src_copy",
			"img_copy",
			"json_copy",
			"sass_compile",
			"react_compile",
			"watch_sass",
			"watch_coffee",
			"watch_json",
			"express"]

gulp.task "bower_src_copy", ->
	gulp.src "./bower/**/*.*", {base: "./bower"}
		.pipe gulp.dest "build/js/bower"

gulp.task "img_copy", ->
	gulp.src "./src/public/img/**/*.*", {base: "./src/public/img"}
		.pipe gulp.dest "build/img"

gulp.task "json_copy", ->
	gulp.src "./src/public/**/*.json"
		.pipe gulp.dest "build/js"

gulp.task "sass_compile", ->
    gulp.src "src/public/sass/**/*.sass"
        .pipe sass()
        .pipe concatCss "css/main.css"
        .pipe gulp.dest "build/"

gulp.task "coffee_compile", ->
		gulp.src ["./src/public/**/*.coffee", "!./src/public/pages/templates/**/*.*"]
			.pipe coffee({bare: true})
			.pipe gulp.dest "./build/js"

gulp.task "react_compile", ["coffee_compile"], ->
	gulp.src "./src/public/pages/templates/**/*.coffee", {base: "./src/public"}
        .pipe coffee({bare: true})
        .pipe header "/** @jsx React.DOM */\n\n"
		.pipe jsx()
		.pipe gulp.dest "./build/js"

gulp.task "express", ->
	nodemon {script: "index.coffee", ext: "coffee js"}

gulp.task "watch_sass", ->
	gulp.watch "src/public/sass/*.sass", ["sass_compile"]

gulp.task "watch_coffee", ->
	gulp.watch "src/public/**/*.coffee", ["react_compile"]

gulp.task "watch_json", ->
	gulp.watch "src/public/**/*.json", ["json_copy"]

gulp.task "default", ["clean_build"], ->
