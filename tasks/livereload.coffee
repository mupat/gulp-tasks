connect = require 'connect'
serveStatic = require 'serve-static'
gulp = require 'gulp'
gUtil = require 'gulp-util'
gLivereload = require 'gulp-livereload'

exports = {}
exports.contentServer = (dest) ->
  port = gUtil.env.port || 5000
  connect().use(serveStatic(dest)).listen port
  gUtil.log gUtil.colors.cyan('Local Server started on:'), gUtil.colors.magenta(port)

exports.livereloadServer = (dest) ->
  gLivereload.listen() # start livereload server
  server = gLivereload() # create server stream
  
  #add on every change in the build path, trigger livereload server changes
  gulp.watch("#{dest}/**/*").on 'change', (file) -> server.changed file.path

module.exports = exports