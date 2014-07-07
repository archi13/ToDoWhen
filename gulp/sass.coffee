gulp = require "gulp"
sass = require "gulp-ruby-sass"

gulp.task "sass", ->
    gulp.src "src/sass/*.sass"
        .pipe sass()
        .pipe gulp.dest "build/css"