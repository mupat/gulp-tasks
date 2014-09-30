gulp = require 'gulp'
gUtil = require 'gulp-util'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
error = require "#{__dirname}/error"

exports = {}
exports.build = (src, dest, name = 'app.js') ->
  options = 
    debug: gUtil.env.development
    extensions: [".coffee"]

  stream = browserify(options)
            .transform("/node_modules/gulp-tasks/node_modules/coffeeify/index.js")
            .on('error', error.handler)
            .add(src)
            .bundle()

  stream
    .pipe(source(name))
    .pipe(gulp.dest(dest))

module.exports = exports