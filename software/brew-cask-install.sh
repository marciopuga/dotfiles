#!/bin/sh

command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew Now"; \
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

echo " Installing native apps using \`brew cask\`."

apps=(
  alfred
  filezilla
  vlc
  firefox
  google-chrome
  spotify
  paw
  slack
  docker
)

brew cask install "${apps[@]}"

echo " Successfully installed all brew cask apps.\n"
