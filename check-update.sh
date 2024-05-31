#!/bin/sh

GIT_VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/randovania/randovania/releases/latest | sed 's|^.*tag/v||')
SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"

if grep -q "$GIT_VERSION" "$SCRIPT_DIR/latest_version"; then
  #Déjà à la dernière version
  exit 0;
fi

notify-send "Une mise à jour est disponible pour Randovania : $GIT_VERSION"
