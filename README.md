# basherify

A basic setup to bring [browserify](https://github.com/substack/node-browserify#browserify) in your folder via bash scripts.

### Getting started

In order to have this repo files in follow these steps in a terminal and after creating a new repository:
```bash
PROJECT=test # actually YOUR project name
NAME=WebReflection # actually YOUR name
# # # # # # # # #
mkdir $PROJECT
cd $PROJECT
git init
git pull git@github.com:WebReflection/basherify.git master
```

From now on all commands in the [Makefile](Makefile) will be available.

Here how to eventually push this initial state to your new project:
```bash
touch README.md
git add .
git commit -m "first commit"
git remote add origin git@github.com:$NAME/$PROJECT.git
git push -u origin master
```


### auto dependencies if not present
Please **bear in mind** if required modules are not installed globally, these will be installed locally.

These are modules used by utils files:

  * [browserify](https://github.com/substack/node-browserify#browserify)
  * [watchify](https://github.com/substack/watchify#watchify)
  * [jshint](https://github.com/jshint/jshint/#jshint-a-static-code-analysis-tool-for-javascript)
  * [uglifyjs](https://github.com/mishoo/UglifyJS#uglifyjs--a-javascript-parsercompressorbeautifier)

## make options
following all possibility the `Makefile` offers.


#### make
will build through browserify and the minifier only after the linter has successfully parsed all files.

#### make bundle
will simply run browserify against `src/main.js` and create the `js/bundle.max.js` file

#### make watch
will run `make bundle` automatically every time a file changes. Based on [watchify](https://github.com/substack/watchify#watchify)

#### make minified
run the bundler then minifies it and show the size in bytes

#### make jshint
run jshint against the whole `src/` folder and every subfolder looking for `.js` files

#### make size
simply shows size of `js/bundle.max.js` and its minified `js/bundle.js`

#### LICENSE
variable used to place a basic license in the minified version of the bundle.

Please update it with any relevant info you think should ship with the project once minified.



### main folders structure
`main.js` is the file that will be used to initialize the project.

You can `require("./local")` or `require("global")` modules from there and any other file inside the `src/` folder.

**minified** version of the project will be inside `js/bundle.js` while the maximized version will be `js/bundle.max.js`.

`jshint` will check all files inside the `src/` folder only and if you use just `make` and the linter fails nothing will happen.

Be sure the linter is OK and the bundle will work as expected.

The minifier will show the size in bytes before and after.

`make watch` will automatically compile all files and recreate bundles as soon as something changes.