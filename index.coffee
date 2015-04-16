basePath = "#{__dirname}/tasks"
tasks =
  browserify: require "#{basePath}/browserify"
  jade:       require "#{basePath}/jade"
  less:       require "#{basePath}/less"
  error:      require "#{basePath}/error"
  server:     require "#{basePath}/server"
  misc:       require "#{basePath}/misc"

module.exports = tasks
