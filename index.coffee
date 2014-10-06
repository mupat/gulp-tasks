basePath = "#{__dirname}/tasks"
tasks =
  browserify: require "#{basePath}/browserify"
  jade:       require "#{basePath}/jade"
  less:       require "#{basePath}/less"
  error:      require "#{basePath}/error"
  livereload: require "#{basePath}/livereload"
  misc:       require "#{basePath}/misc"

module.exports = tasks
