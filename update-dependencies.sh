#!/usr/bin/env bash
set -e

[[ -z "${LOCKFILE}" ]] && { echo 1>&2 "Missing LOCKFILE"; exit 1; }

MANIFESTFILE=io.github.streamlink.twitch-gui.json
OUTPUT=streamlink-twitch-gui.json

MANIFEST="$(cat "${MANIFESTFILE}")"
RUNTIME="$(jq -r '.sdk' <<< "${MANIFEST}")//$(jq -r '.["runtime-version"]' <<< "${MANIFEST}")"

python3 ./flatpak-builder-tools/node/flatpak-node-generator.py \
  --output "${OUTPUT}" \
  --xdg-layout \
  yarn \
  ${LOCKFILE}
