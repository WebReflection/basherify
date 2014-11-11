# basherify

A basic setup to bring [browserify](https://github.com/substack/node-browserify#browserify) in your folder via bash scripts.

## Getting started

In order to have this repo files in follow these steps in a terminal and after creating a new repository:
```bash
PROJECT=test # actually YOUR project name
NAME=WebReflection # actually YOUR name
# # # # # # # # #
mkdir $PROJECT
cd $PROJECT
git init
git pull git@github.com:WebReflection/basherify.git master
echo "" >README.md
git add .
git commit -m "first commit"
git remote add origin git@github.com:$NAME/$PROJECT.git
git push -u origin master
```
From now on all commands in the [Makefile](Makefile) will be available.

## structure
`main.js` is the file that will be used to initialize the project.

You can `require("./local")` or `require("global")` modules from there and any other file inside the `src/` folder.

**minified** version of the project will be inside `js/bundle.js` while the maximized version will be `js/bundle.max.js`.

`jshint` will check all files inside the `src/` folder only and if you use just `make` and the linter fails nothing will happen.

Be sure the linter is OK and the bundle will work as expected.

The minifier will show the size in bytes before and after.

`make watch` will automatically compile all files and recreate bundles as soon as something changes.