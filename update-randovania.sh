#!/bin/sh

VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/randovania/randovania/releases/latest | sed 's|^.*tag/v||')
SCRIPT_PATH="$(readlink -f "$0")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
RANDOVANIA_EXTRACTED_NAME=randovania-$VERSION

if grep -q "$VERSION" "$SCRIPT_DIR/latest_version"; then
  echo "La mise à jour $VERSION est déjà installée !"
  exit 1;
fi

echo "Téléchargement de la mise à jour $VERSION"
wget -q -P /tmp/ https://github.com/randovania/randovania/releases/download/v"$VERSION"/randovania-"$VERSION"-linux.tar.gz

tar -xzf /tmp/randovania-"$VERSION"-linux.tar.gz randovania-$VERSION --strip-components=1 -C "$SCRIPT_DIR"

echo "Mise à jour effectuée avec succès !";

echo $VERSION > $SCRIPT_DIR/latest_version
exit 0;
