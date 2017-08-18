#!/bin/bash

docker run --rm \
  -e DRONE_REPO_OWNER="foo" \
  -e DRONE_REPO_NAME="bar" \
  -v /tmp/drone-cache:/cache \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  janstuemmel/drone-cache
