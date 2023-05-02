#!/usr/bin/env bash

#—————————————————————— colored_echo –
# Function to print on the console using a color format
#
# Params
#   $1 = Log message to be printed
#   $2 = tput color
colored_echo () {
  local LOG_MESSAGE=$1;
  local COLOR=$2;
  local NCOLORS=$(tput colors)

  if test -t 1; then
    if test -n "$NCOLORS" && test $NCOLORS -ge 8; then
      if ! [[ $COLOR =~ '^[0-9]$' ]] ; then
        case $(echo $COLOR | tr '[:upper:]' '[:lower:]') in
        black )
          COLOR=0 ;;
        red )
          COLOR=1 ;;
        green )
          COLOR=2 ;;
        yellow )
          COLOR=3 ;;
        blue )
          COLOR=4 ;;
        magenta )
          COLOR=5 ;;
        cyan )
          COLOR=6 ;;
        white|* ) 
          COLOR=7 ;;
        esac
      fi

      tput setaf $COLOR;
      echo $LOG_MESSAGE;
      tput sgr0;
    else
      echo $LOG_MESSAGE
    fi
  else
    echo $LOG_MESSAGE;
  fi
}

#—————————————————————— info –
# Function to print on the console using the info format
#
# Params
#   $1 = Log message to be printed
info() {
  local LOG_MESSAGE=$1
  if [ "${LOG_MESSAGE}" != 0 ]; then
    colored_echo "[INFO] ${LOG_MESSAGE}" yellow
  fi
}

#—————————————————————— error –
# Function to print on the console using the error format
#
# Params
#   $1 = Log message to be printed
error() {
  local LOG_MESSAGE=$1
  if [ "${LOG_MESSAGE}" != '' ]; then
    colored_echo "[ERROR] ${LOG_MESSAGE}" red
  fi
}

#—————————————————————— fatal –
# Function to print on the console using the fatal format
#
# Params
#   $1 = Log message to be printed
fatal() {
  local LOG_MESSAGE=$1
  if [ "${LOG_MESSAGE}" != '' ]; then
    colored_echo "[FATAL] ${LOG_MESSAGE}" red
  fi
}

#—————————————————————— success –
# Function to print on the console using the success format
#
# Params
#   $1 = Log message to be printed
success() {
  local LOG_MESSAGE=$1
  if [ "${LOG_MESSAGE}" != '' ]; then
    colored_echo "[SUCCESS] ${LOG_MESSAGE}" green
  fi
}
# END
