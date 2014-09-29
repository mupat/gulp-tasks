gulp = require 'gulp'
gJade = require 'gulp-jade'
gUtil = require 'gulp-util'
gIf = require 'gulp-if'
gEmbedLiveReload = require 'gulp-embedlr'
error = require "#{__dirname}/error"

exports = {}
exports.build = (src, dest, embed = false, locals = {}) ->
    gulp.src(src)
      .pipe(gJade(
        pretty: gUtil.env.development
        locals: locals
      ).on('error', error.handler))
      .pipe(gIf(embed, gEmbedLiveReload()))
      .pipe(gulp.dest(dest))

module.exports = exports