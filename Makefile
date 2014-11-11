.PHONY: build bundle watch minified jshint dependencies

LICENSE = "/*! (C) Your Name - License */"

### (C) Andrea Giammarchi - WTFPL License

# default: lints the code and minifies it if everything is fine
build:    
	make -s jshint
	make -s minified

# bundle: creates the browserified version of the project as js/bundle.max.js
bundle:
	sh utils/browserify.sh

# watch: update the browserified version of the project as soon as file changes
watch:
	sh utils/watchify.sh

# minified: create the minifeid version of the project as js/bundle.js
minified:
	make -s bundle
	sh utils/uglifyjs.sh $(LICENSE)
	make -s size

# jshint: recursively checks for javascript files inside the src folder and lint them
jshint:
	sh utils/jshint.sh

# shows the resulting size before and after minifiaction
size:
	echo ""
	echo "[  bytes  ] < bundle.max.js"
	cat js/bundle.max.js | wc -c
	echo ""
	echo "[  bytes  ] < bundle.js"
	gzip -c js/bundle.js | wc -c
	echo ""
