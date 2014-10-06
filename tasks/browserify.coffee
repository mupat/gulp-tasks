gulp = require 'gulp'
gUtil = require 'gulp-util'
browserify = require 'browserify'
globalShim = require 'browserify-global-shim'
source = require 'vinyl-source-stream'
error = require "#{__dirname}/error"
coffeeify = require "coffeeify"

preShims =
  angular: 'angular'
  leaflet: 'L'

exports = {}
exports.build = (src, dest, name = 'app.js', shims = preShims) ->
  options =
    debug: gUtil.env.development
    extensions: [".coffee"]

  # add shims to browserify
  bShims = globalShim.configure shims

  stream = browserify(options)
            .transform((file) -> coffeeify file) # make sure, we use coffeeify from this node_modules
            .transform(bShims)
            .add(src)
            .bundle()
            .on('error', error.handler)

  stream
    .pipe(source(name))
    .pipe(gulp.dest(dest))

module.exports = exports
