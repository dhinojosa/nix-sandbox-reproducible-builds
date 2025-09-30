#!/bin/bash

# First update the channels

nix-channel --update

# To look for elements, you can run the following
# nix-env -qaP '*<search-term>*'
export NIX_SHOW_WARNINGS=0
nix --extra-experimental-features 'nix-command flakes' search nixpkgs ruby