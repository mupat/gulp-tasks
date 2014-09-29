gNotify = require 'gulp-notify'

exports = {}
exports.handler = ->
  args = Array.prototype.slice.call arguments
  
  gNotify.onError(
    title: "Compile Error"
    message: "<%= error %>"
  ).apply @, args

  @emit 'end' if @emit?

module.exports = exports