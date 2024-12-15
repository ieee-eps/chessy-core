#!/usr/bin/env bash

export DISPLAY=:0
xhost +
npx electron ./interface/src/index.js --no-sandbox