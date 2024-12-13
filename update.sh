#!/usr/bin/env bash

source scripts/colors.sh

remote="https://github.com/ieee-eps/chessy-core"

function echom() {
  echo -e "\033[0m$*\033[0m"
}

version_local=$(git rev-parse HEAD)
version_remote=$(git ls-remote "$remote" HEAD)

version_remote=${version_remote:0:40}

if [ "$version_remote" == "$version_local" ]; then
  echom "${BG_BRIGHT_GREEN}${FG_BRIGHT_WHITE} K ${COLOR_RESET}${FG_BRIGHT_WHITE} À jour ! (${FG_BRIGHT_CYAN}${version_local:0:7}${FG_BRIGHT_WHITE})"
else
  echom "${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} I ${COLOR_RESET}${FG_BRIGHT_WHITE} Une nouvelle version a été trouvée !"
  echom "${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} I ${COLOR_RESET}${FG_BRIGHT_RED} ${version_local:0:7}${FG_BRIGHT_WHITE} -> ${FG_BRIGHT_GREEN}${version_remote:0:7}"
  echom "${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} I ${COLOR_RESET}${FG_BRIGHT_WHITE} Version actuelle : (${FG_BRIGHT_CYAN}${version_local:0:7}${FG_BRIGHT_WHITE})"
  echom "${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} I ${COLOR_RESET}${FG_BRIGHT_WHITE} Pull ..."
  git pull
  version_local=$(git rev-parse HEAD)
  if [ "$version_remote" != "$version_local" ]; then
    echom "${BG_BRIGHT_RED}${FG_BRIGHT_WHITE} ! ${COLOR_RESET}${FG_BRIGHT_RED} Les version ne sont pas compatibles ! Le git est-il correcte ?"
  else
    echom "${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} I ${COLOR_RESET}${FG_BRIGHT_WHITE} Version actuelle : (${FG_BRIGHT_CYAN}${version_local:0:7}${FG_BRIGHT_WHITE})"
  fi
fi

chmod u+x ./update.sh