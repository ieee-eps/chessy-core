#!/bin/bash

COLOR_BASE_FORE=$(echo -e "\033[38;5;")
COLOR_BASE_BACK=$(echo -e "\033[48;5;")

COLOR_CODE_BLACK="0"
COLOR_CODE_RED="1"
COLOR_CODE_GREEN="2"
COLOR_CODE_YELLOW="3"
COLOR_CODE_BLUE="4"
COLOR_CODE_PURPLE="5"
COLOR_CODE_CYAN="6"
COLOR_CODE_WHITE="7"
COLOR_CODE_BRIGHT_BLACK="8"
COLOR_CODE_BRIGHT_RED="9"
COLOR_CODE_BRIGHT_GREEN="10"
COLOR_CODE_BRIGHT_YELLOW="11"
COLOR_CODE_BRIGHT_BLUE="12"
COLOR_CODE_BRIGHT_PURPLE="13"
COLOR_CODE_BRIGHT_CYAN="14"
COLOR_CODE_BRIGHT_WHITE="15"
COLOR_RESET=$(echo -e "\033[0m")

FG_BLACK="${COLOR_BASE_FORE}${COLOR_CODE_BLACK}m"
FG_RED="${COLOR_BASE_FORE}${COLOR_CODE_RED}m"
FG_GREEN="${COLOR_BASE_FORE}${COLOR_CODE_GREEN}m"
FG_YELLOW="${COLOR_BASE_FORE}${COLOR_CODE_YELLOW}m"
FG_BLUE="${COLOR_BASE_FORE}${COLOR_CODE_BLUE}m"
FG_PURPLE="${COLOR_BASE_FORE}${COLOR_CODE_PURPLE}m"
FG_CYAN="${COLOR_BASE_FORE}${COLOR_CODE_CYAN}m"
FG_WHITE="${COLOR_BASE_FORE}${COLOR_CODE_WHITE}m"
FG_BRIGHT_BLACK="${COLOR_BASE_FORE}${COLOR_CODE_BRIGHT_BLACK}m"
FG_BRIGHT_RED="${COLOR_BASE_FORE}${COLOR_CODE_BRIGHT_RED}m"
FG_BRIGHT_GREEN="${COLOR_BASE_FORE}${COLOR_CODE_BRIGHT_GREEN}m"
FG_BRIGHT_YELLOW="${COLOR_BASE_FORE}${COLOR_CODE_BRIGHT_YELLOW}m"
FG_BRIGHT_BLUE="${COLOR_BASE_FORE}${COLOR_CODE_BRIGHT_BLUE}m"
FG_BRIGHT_PURPLE="${COLOR_BASE_FORE}${COLOR_CODE_BRIGHT_PURPLE}m"
FG_BRIGHT_CYAN="${COLOR_BASE_FORE}${COLOR_CODE_BRIGHT_CYAN}m"
FG_BRIGHT_WHITE="${COLOR_BASE_FORE}${COLOR_CODE_BRIGHT_WHITE}m"

BG_BLACK="${COLOR_BASE_BACK}${COLOR_CODE_BLACK}m"
BG_RED="${COLOR_BASE_BACK}${COLOR_CODE_RED}m"
BG_GREEN="${COLOR_BASE_BACK}${COLOR_CODE_GREEN}m"
BG_YELLOW="${COLOR_BASE_BACK}${COLOR_CODE_YELLOW}m"
BG_BLUE="${COLOR_BASE_BACK}${COLOR_CODE_BLUE}m"
BG_PURPLE="${COLOR_BASE_BACK}${COLOR_CODE_PURPLE}m"
BG_CYAN="${COLOR_BASE_BACK}${COLOR_CODE_CYAN}m"
BG_WHITE="${COLOR_BASE_BACK}${COLOR_CODE_WHITE}m"
BG_BRIGHT_BLACK="${COLOR_BASE_BACK}${COLOR_CODE_BRIGHT_BLACK}m"
BG_BRIGHT_RED="${COLOR_BASE_BACK}${COLOR_CODE_BRIGHT_RED}m"
BG_BRIGHT_GREEN="${COLOR_BASE_BACK}${COLOR_CODE_BRIGHT_GREEN}m"
BG_BRIGHT_YELLOW="${COLOR_BASE_BACK}${COLOR_CODE_BRIGHT_YELLOW}m"
BG_BRIGHT_BLUE="${COLOR_BASE_BACK}${COLOR_CODE_BRIGHT_BLUE}m"
BG_BRIGHT_PURPLE="${COLOR_BASE_BACK}${COLOR_CODE_BRIGHT_PURPLE}m"
BG_BRIGHT_CYAN="${COLOR_BASE_BACK}${COLOR_CODE_BRIGHT_CYAN}m"
BG_BRIGHT_WHITE="${COLOR_BASE_BACK}${COLOR_CODE_BRIGHT_WHITE}m"

export FG_BLACK
export FG_RED
export FG_GREEN
export FG_YELLOW
export FG_BLUE
export FG_PURPLE
export FG_CYAN
export FG_WHITE
export FG_BRIGHT_BLACK
export FG_BRIGHT_RED
export FG_BRIGHT_GREEN
export FG_BRIGHT_YELLOW
export FG_BRIGHT_BLUE
export FG_BRIGHT_PURPLE
export FG_BRIGHT_CYAN
export FG_BRIGHT_WHITE

export BG_BLACK
export BG_RED
export BG_GREEN
export BG_YELLOW
export BG_BLUE
export BG_PURPLE
export BG_CYAN
export BG_WHITE
export BG_BRIGHT_BLACK
export BG_BRIGHT_RED
export BG_BRIGHT_GREEN
export BG_BRIGHT_YELLOW
export BG_BRIGHT_BLUE
export BG_BRIGHT_PURPLE
export BG_BRIGHT_CYAN
export BG_BRIGHT_WHITE

export COLOR_RESET