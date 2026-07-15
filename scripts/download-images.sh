#!/usr/bin/env bash
# One-time: fetch the classical paintings into assets/img/ with zero guesswork.
# Resolves each file's real thumbnail URL via the Wikimedia API, so it can't
# break on hash-prefix guesses. Run from the repo root:
#   bash scripts/download-images.sh
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p assets/img
# Find a Python that actually runs. Windows ships fake python/python3 stubs
# (App Execution Aliases) that only print a Microsoft Store message, so testing
# existence via `command -v` is not enough — we must execute a no-op.
PY=""
for cand in python3 python py; do
  if "$cand" -c "pass" >/dev/null 2>&1; then PY="$cand"; break; fi
done
[ -n "$PY" ] || { echo "ERROR: no working Python found (python3/python/py all failed)." >&2; exit 1; }
API="https://commons.wikimedia.org/w/api.php"

fetch () {  # fetch <out.jpg> <Commons File name> <width>
  local out="assets/img/$1" title="$2" width="${3:-1200}"
  # ask the API for a thumbnail URL at the requested width
  local url
  url=$(curl -fsSL --get "$API" \
        --data-urlencode "action=query" \
        --data-urlencode "titles=File:$title" \
        --data-urlencode "prop=imageinfo" \
        --data-urlencode "iiprop=url" \
        --data-urlencode "iiurlwidth=$width" \
        --data-urlencode "format=json" \
      | "$PY" -c "import sys,json;p=next(iter(json.load(sys.stdin)['query']['pages'].values()));print(p['imageinfo'][0]['thumburl'])")
  curl -fL --retry 3 -o "$out" "$url"
  head -c 3 "$out" | od -An -tx1 | grep -qi 'ff d8 ff' \
    || { echo "ERROR: $out not a JPEG"; rm -f "$out"; exit 1; }
  echo "  ok  $1"
}

fetch lacemaker.jpg  "Johannes Vermeer - The lacemaker (c.1669-1671).jpg" 1000
fetch astronomer.jpg "Johannes Vermeer - The Astronomer - WGA24685.jpg"   1000
fetch wanderer.jpg   "Caspar David Friedrich - Wanderer above the sea of fog.jpg" 1000
fetch babel.jpg      "Pieter Bruegel the Elder - The Tower of Babel (Vienna) - Google Art Project - edited.jpg" 1000
fetch adam.jpg       "Creation of Adam Michelangelo.jpg" 1000
fetch athens.jpg     "Raphael School of Athens.jpg" 1200
fetch ironmill.jpg   "Adolph Menzel - Eisenwalzwerk - Google Art Project.jpg" 1400

echo "Done. $(ls assets/img/*.jpg | wc -l | tr -d ' ') JPEGs in assets/img/"
