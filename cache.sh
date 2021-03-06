#!/bin/bash
set -e

CACHE_DIR="/cache/$DRONE_REPO_OWNER/$DRONE_REPO_NAME"
CACHE_FILE="cache.tar.gz"

# RESTORE
if [ -z "$PLUGIN_CACHE" ]; then
  echo "Restoring cache..."

  if [ -f "$CACHE_DIR/$CACHE_FILE" ]; then
    echo "extracting $CACHE_DIR/$CACHE_FILE"
    tar xzf "$CACHE_DIR/$CACHE_FILE"
  else
    echo "No cache file found for $DRONE_REPO_OWNER/$DRONE_REPO_NAME"
  fi

# REBUILD
else
  IFS=','; read -ra SOURCES <<< "$PLUGIN_CACHE"
  mkdir -p $CACHE_DIR
  echo "Rebuilding cache for: ${SOURCES[@]}"
  tar czf "$CACHE_DIR/$CACHE_FILE" ${SOURCES[@]}
fi
