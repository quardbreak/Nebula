#!/bin/sh
set -e
DOMAIN_BYOND="http://www.byond.com/download/build"
DOMAIN_MIRROR="https://spacestation13.github.io/byond-builds"
USER_AGENT="User-Agent: NebulaSS13/1.0 Continuous Integration"
if [ -f "$HOME/BYOND-${BYOND_MAJOR}.${BYOND_MINOR}/byond/bin/DreamMaker" ];
then
  echo "Using cached directory."
else
  echo "Setting up BYOND."
  mkdir -p "$HOME/BYOND-${BYOND_MAJOR}.${BYOND_MINOR}"
  cd "$HOME/BYOND-${BYOND_MAJOR}.${BYOND_MINOR}"
  echo "Installing DreamMaker to $PWD"
  curl --fail "${DOMAIN_BYOND}/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -H "${USER_AGENT}" -o byond.zip \
  || curl --fail "${DOMAIN_MIRROR}/${BYOND_MAJOR}/${BYOND_MAJOR}.${BYOND_MINOR}_byond_linux.zip" -H "${USER_AGENT}" -o byond.zip
  unzip -o byond.zip
  cd byond
  make here
fi
