#!/usr/bin/env bash

source scripts/colors.sh

function echom() {
  echo -e "\033[0m$*\033[0m"
}

chmod a+x ./update.sh
chmod a+x ./run.sh

npm install