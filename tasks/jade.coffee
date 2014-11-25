gulp = require 'gulp'
gJade = require 'gulp-jade'
gUtil = require 'gulp-util'
gIf = require 'gulp-if'
gEmbedLiveReload = require 'gulp-embedlr'
error = require "#{__dirname}/error"

exports = {}
exports.build = (src, dest, embed = undefined, locals = {}) ->
    # either embed is true or the port to use
    port = if embed is true then gUtil.env.liveport || 35729 else gUtil.env.liveport || embed || 35729
    gulp.src(src)
      .pipe(gJade(
        pretty: gUtil.env.development
        locals: locals
      ).on('error', error.handler))
      .pipe(gIf(embed?, gEmbedLiveReload(port: port)))
      .pipe(gulp.dest(dest))

module.exports = exports
