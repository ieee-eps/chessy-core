#!/usr/bin/env bash

source colors.sh

remote="https://github.com/ieee-eps/chessy-system"

echo "${COLOR_RESET}${BG_BRIGHT_BLACK} D ${COLOR_RESET}${FG_WHITE} Vérification des mises à jours ...${COLOR_RESET}"

version_local=$(git rev-parse HEAD)
version_remote=$(git ls-remote "$remote" HEAD)

version_remote=${version_remote:0:40}



if [ "$version_remote" != "$version_local" ]; then
  echo "${COLOR_RESET}${BG_BRIGHT_GREEN}${FG_BRIGHT_WHITE} K ${COLOR_RESET}${FG_BRIGHT_WHITE} À jour ! (${FG_BRIGHT_CYAN}${version_local:0:7}${FG_BRIGHT_WHITE})${COLOR_RESET}"
else
  echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} I ${COLOR_RESET}${FG_BRIGHT_WHITE} Une nouvelle version a été trouvée ! ${COLOR_RESET}"
  echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} I ${COLOR_RESET}${FG_BRIGHT_RED} ${version_local:0:7}${FG_BRIGHT_WHITE} -> ${FG_BRIGHT_GREEN}${version_remote:0:7}${COLOR_RESET}"
  if [ -d "./data" ]; then
    echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} L ${COLOR_RESET}${FG_WHITE} Vérification du dossier de mise à jour... ${COLOR_RESET}"
    cd ./data
    saved_remote=$(git remote get-url origin)
    if [ "$remote" != "$saved_remote" ]; then
      echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} L ${COLOR_RESET}${FG_WHITE} Retéléchargement du git... ${COLOR_RESET}"
      rm -rf "."
      git clone "$remote" .
    else
      echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} L ${COLOR_RESET}${FG_WHITE} Téléchargement du git... ${COLOR_RESET}"
      git pull
    fi
  else
    echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} L ${COLOR_RESET}${FG_WHITE} Création du dossier de mise à jour... ${COLOR_RESET}"
    mkdir "./data/"
    cd "./data"
    echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} L ${COLOR_RESET}${FG_WHITE} Téléchargement du git... ${COLOR_RESET}"
    git clone $remote .
  fi
  echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_WHITE} L ${COLOR_RESET}${FG_WHITE} Configuration de la mise à jour... ${COLOR_RESET}"
  git checkout "$version_remote"
  echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_YELLOW} ! ${COLOR_RESET}${FG_BRIGHT_YELLOW} Copie ... ${COLOR_RESET}"
  cp -rf ./* ../../
  echo "${COLOR_RESET}${BG_BRIGHT_BLUE}${FG_BRIGHT_YELLOW} ! ${COLOR_RESET}${FG_BRIGHT_YELLOW} Mise à jour terminée ... ${COLOR_RESET}"
fi