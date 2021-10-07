#!/usr/bin/env bash
set -e

mkdir -p result
nix-build --out-link result/build-only/create-react-app.nix images/build-only/create-react-app.nix
docker image rm -f glot/create-react-app
docker load < result/build-only/create-react-app.nix
systemctl restart docker.service