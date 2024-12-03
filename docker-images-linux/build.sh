#!/bin/bash
nix-build
docker load < ./result
