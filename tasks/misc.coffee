gulp = require 'gulp'

exports = {}
exports.copy = (src, dest) ->
  gulp.src(src)
    .pipe(gulp.dest(dest))

module.exports = exports
