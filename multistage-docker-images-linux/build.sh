#!/bin/bash
nix-build
docker load < result
docker run -it my-app:1.0.0