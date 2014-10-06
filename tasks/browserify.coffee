gulp = require 'gulp'
gUtil = require 'gulp-util'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
error = require "#{__dirname}/error"
coffeeify = require "coffeeify"

exports = {}
exports.build = (src, dest, name = 'app.js') ->
  options =
    debug: gUtil.env.development
    extensions: [".coffee"]

  stream = browserify(options)
            .transform((file) -> coffeeify file) # make sure, we use coffeeify from this node_modules
            .add(src)
            .bundle()
            .on('error', error.handler)

  stream
    .pipe(source(name))
    .pipe(gulp.dest(dest))

module.exports = exports
