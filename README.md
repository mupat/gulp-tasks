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
### Included modules

- [`debowerify`][debowerify]  # used to simple require bower modules like npm modules
- [`coffeeify`][coffeeify]    # used to work with coffeescript files as well
- [`browserify-global-shim`][global-shim]  # used to not include common frameworks in the bundled file

### Simple Usage
```coffeescript
gTasks.browserify.build '<src_file>', '<dest_folder', '<name of result js file> (OPTIONAL)'
```

### Additional transform steps
```coffeescript
gTasks.browserify.build '<src_file>', '<dest_folder', '<name of result js file>', '[{transformer: <third_party_transformer>, options: <third_party_transformer_options}, [{...}] (OPTIONAL)]'
```

### Adding Shims
```coffeescript
gTasks.browserify.build '<src_file>', '<dest_folder', '<name of result js file>', '[]', '{ <used_name_as_require>: <global_variable_name>}'
```


## Jade
```coffeescript
gTasks.jade.build '<src_file[s]>', '<dest_folder', '[<embed livereload script PORT>] (OPTIONAL)', '[<locals object passed to jade>] (OPTIONAL)'
```
By providing a third parameter to the jade build you defining the port to for the livereload server. So it should match with the one from livereload server!


## Less
Now with usage of the [autoprefix][autoprefix] plugin. Possible options for supported browsers can be found at [browserlist][browserlist] plugin.
```coffeescript
gTasks.less.build '<src_file[s]>', '<dest_folder>', '[<array for supported browsers as defined by browserslist>] (OPTIONAL)'
```

## Livereload
```coffeescript
gTasks.server.content '<dest_folder>', <content port>
gTasks.server.livereload '<dest_folder>', <livereload port>
```

## Misc

### Copy
```coffeescript
gTasks.misc.copy '<src_file[s]>', '<dest_folder'
```

### Clean
```coffeescript
gTasks.misc.clean '<folder_or_files>'
```

[browserlist]: https://github.com/ai/browserslist
[autoprefix]: https://github.com/postcss/autoprefixer
[debowerify]: https://www.npmjs.com/package/debowerify
[coffeeify]: https://www.npmjs.com/package/coffeeify
[global-shim]: https://www.npmjs.com/package/browserify-global-shim
