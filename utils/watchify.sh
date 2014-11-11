#!/usr/bin/env bash

program () {
  local bin="$1"
  local folder="$2"
  if [ "$(which $bin)" = "" ]; then
    mkdir -p node_modules
    if [ -d "node_modules/$bin" ]; then
      bin="$2"
    else
      npm install $bin >/dev/null 2>&1
      bin="$2"
    fi
  fi
  echo $bin
}

run () {
  local bin="$(program 'watchify' 'node_modules/watchify/bin/cmd.js')"
  $bin src/main.js -o js/bundle.max.js -v
}

run
