#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <github_repo_url> <dockerhub>"
  exit 1
fi

GITHUB="$1"
DOCKERHUB="$2"

WORKDIR="$(mktemp -d)"
echo $WORKDIR
trap 'rm -rf "$WORKDIR"' EXIT

git clone "https://github.com/${GITHUB}" "$WORKDIR/repo"

cd "$WORKDIR/repo"

docker build -t "$DOCKERHUB:latest" .

docker push "$DOCKERHUB:latest"