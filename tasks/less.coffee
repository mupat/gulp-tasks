gulp = require 'gulp'
gSourcemaps = require 'gulp-sourcemaps'
gLess = require 'gulp-less'
gUtil = require 'gulp-util'
gIf = require 'gulp-if'
error = require "#{__dirname}/error"

exprts = {}
exports.build = (src, dest) ->
  gulp.src(src)
    .pipe(gIf(gUtil.env.development, gSourcemaps.init()))
    .pipe(gLess().on('error', error.handler))
    .pipe(gIf(gUtil.env.development, gSourcemaps.write()))
    .pipe(gulp.dest(dest))

module.exports = exports