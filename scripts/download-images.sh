#!/usr/bin/env bash
# One-time: fetch the classical paintings into assets/img/ so the site
# has zero runtime dependency on Wikimedia. Run from the repo root:
#   bash scripts/download-images.sh
set -e
cd "$(dirname "$0")/.."
mkdir -p assets/img
F="https://commons.wikimedia.org/wiki/Special:FilePath"
curl -L -o assets/img/lacemaker.jpg  "$F/Johannes_Vermeer_-_The_lacemaker_(c.1669-1671).jpg?width=1400"
curl -L -o assets/img/astronomer.jpg "$F/Johannes_Vermeer_-_The_Astronomer_-_WGA24685.jpg?width=1400"
curl -L -o assets/img/wanderer.jpg   "$F/Caspar_David_Friedrich_-_Wanderer_above_the_sea_of_fog.jpg?width=1400"
curl -L -o assets/img/babel.jpg      "$F/Pieter_Bruegel_the_Elder_-_The_Tower_of_Babel_(Vienna)_-_Google_Art_Project_-_edited.jpg?width=1400"
curl -L -o assets/img/adam.jpg       "$F/Creation_of_Adam_Michelangelo.jpg?width=1400"
curl -L -o assets/img/athens.jpg     "$F/Raphael_School_of_Athens.jpg?width=1400"
echo "Done. $(ls assets/img | wc -l | tr -d ' ') files in assets/img/"
