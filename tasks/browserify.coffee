gulp = require 'gulp'
gUtil = require 'gulp-util'
browserify = require 'browserify'
globalShim = require 'browserify-global-shim'
source = require 'vinyl-source-stream'
error = require "#{__dirname}/error"
coffeeify = require "coffeeify"
debowerify = require 'debowerify'

exports = {}
exports.build = (src, dest, name = 'app.js', additionalTransforms = [], shims = {}) ->
  options =
    debug: gUtil.env.development
    extensions: [".coffee"]

  # add shims to browserify
  bShims = globalShim.configure shims

  stream = browserify(options)
  stream.transform(t.transformer, t.options) for t in additionalTransforms

  stream
    .transform((file) -> coffeeify file) # make sure, we use coffeeify from this node_modules
    .transform(bShims)
    .transform(debowerify)
    .add(src)
    .bundle()
    .on('error', error.handler)
    .pipe(source(name))
    .pipe(gulp.dest(dest))

module.exports = exports
