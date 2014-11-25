#gulp-tasks

a summary of gulp tasks, that i use over various projects.
Just include this repository and require it
```coffeescript
gTasks = require 'gulp-tasks'
```

# Defining Ports
Ports can be defined either by passing them as parameter to the functions or by passing them as commandline parameters to gulp
```bash
<gulpCMD> --port=<contentPort> --liveport=<livereload port>
```

# Tasks
## Browserify
```coffeescript
gTasks.browserify.build '<src_file>', '<dest_folder', '[<name of result js file>]'
```

## Jade
```coffeescript
gTasks.jade.build '<src_file[s]>', '<dest_folder', '[<embed livereload script PORT>]', '[<locals object passed to jade>]'
```
By providing a third parameter to the jade build you defining the port to for the livereload server. So it should match with the one from livereload server!


## Less
```coffeescript
gTasks.less.build '<src_file[s]>', '<dest_folder>'
```

## Livereload
```coffeescript
gTasks.livereload.contentServer '<dest_folder>', <content port>
gTasks.livereload.livereloadServer '<dest_folder>', <livereload port>
```
