#!/usr/bin/env bash
set -e

flatpak-builder \
  --force-clean \
  --disable-cache \
  build \
  io.github.streamlink.twitch-gui.json
