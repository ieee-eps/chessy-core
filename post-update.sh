#!/usr/bin/env bash

source scripts/colors.sh

function echom() {
  echo -e "\033[0m$*\033[0m"
}

chmod a+x ./update.sh
chmod a+x ./run.sh
chmod a+x ./interface/start_interface.sh

echom "${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} ... ${COLOR_RESET} ${FG_BRIGHT_WHITE}Démarrage ..."

./run.sh