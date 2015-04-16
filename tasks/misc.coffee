gulp = require 'gulp'
gClean = require 'gulp-clean'

exports = {}
exports.copy = (src, dest) ->
  gulp.src(src)
    .pipe(gulp.dest(dest))

exports.clean = (path)->
  gulp.src(path)
    .pipe(gClean({force: true}))

module.exports = exports
