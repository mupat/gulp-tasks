#gulp-tasks

a summary of gulp tasks, that i use over various projects.
Just include this repository and require it
```coffeescript
gTasks = require 'gulp-tasks'
```

# Tasks
## Browserify
```coffeescript
gTasks.browserify.build '<src_file>', '<dest_folder', '[<name of result js file>]'
```

## Jade
```coffeescript
gTasks.jade.build '<src_file[s]>', '<dest_folder', '[<embed livereload script>]', '[<locals object passed to jade>]'
```

## Less
```coffeescript
gTasks.less.build '<src_file[s]>', '<dest_folder>'
```

## Livereload
```coffeescript
gTasks.livereload.contentServer '<dest_folder>'
gTasks.livereload.livereloadServer '<dest_folder>'
```
