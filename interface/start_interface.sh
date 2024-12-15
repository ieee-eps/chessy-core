#!/usr/bin/env bash

function run_s() {
  export DISPLAY=:0
  xhost +
  npx electron ./interface/src/index.js --no-sandbox
}

startx & run_s