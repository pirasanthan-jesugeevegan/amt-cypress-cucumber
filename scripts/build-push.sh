#!/usr/bin/env bash
set -ex

source scripts/common.sh

# Build image with current revision, caching from latest
docker pull -q ${UI_RUNNER_DOCKER_IMAGE_CACHE}
docker build \
  --cache-from ${UI_RUNNER_DOCKER_IMAGE_CACHE} \
  -t ${UI_RUNNER_DOCKER_IMAGE_REV} \
  .

docker push -q ${UI_RUNNER_DOCKER_IMAGE_REV}

echo $GITHUB_HEAD_REF
echo $GITHUB_REF
echo $GITHUB_BASE_REF
echo "##[set-output name=branch;]$(echo ${GITHUB_REF#refs/heads/})"
echo "##[set-output name=branch;]${GITHUB_REF#refs/heads/}"
echo $github.head_ref
if [ "$GITHUB_REF" == "master" ]
then
    docker tag ${UI_RUNNER_DOCKER_IMAGE_REV} ${UI_RUNNER_DOCKER_IMAGE_CACHE}
    docker push -q ${UI_RUNNER_DOCKER_IMAGE_CACHE}
fi
