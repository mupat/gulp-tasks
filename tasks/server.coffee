connect = require 'connect'
serveStatic = require 'serve-static'
gulp = require 'gulp'
gUtil = require 'gulp-util'
gLivereload = require 'gulp-livereload'

exports = {}
exports.content = (dest, port) ->
  port = gUtil.env.port || port || 5000
  connect().use(serveStatic(dest)).listen port # start content server
  gUtil.log gUtil.colors.cyan('Local Server started on:'), gUtil.colors.magenta(port)

exports.livereload = (dest, port) ->
  port = gUtil.env.liveport || port || 35729
  gLivereload.listen port # start livereload server

  #add on every change in the build path, trigger livereload server changes
  gulp.watch("#{dest}/**/*").on 'change', (file) -> gLivereload.changed file.path, port

module.exports = exports
