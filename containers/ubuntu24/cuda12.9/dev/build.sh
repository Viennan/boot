#!/bin/bash

set -e

src_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

docker buildx build \
  --build-context boot_repos=${BOOT_REPOS_PATH} \
  --build-arg HOST_USER=$(whoami) \
  --build-arg HOST_UID=$(id -u) \
  --build-arg HOST_GID=$(id -g) \
  -f ${src_dir}/build.dockerfile \
  -t ${USER}/ubuntu24/cuda12.9/dev:latest ${src_dir}
