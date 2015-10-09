gulp = require 'gulp'
del = require 'del'

exports = {}
exports.copy = (src, dest) ->
  gulp.src(src)
    .pipe(gulp.dest(dest))

exports.clean = (path) ->
  del(path)

module.exports = exports
