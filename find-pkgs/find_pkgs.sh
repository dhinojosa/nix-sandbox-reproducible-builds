#!/bin/bash

# First update the channels

nix-channel --update

# To look for elements, you can run the following
# nix-env -qaP '*<search-term>*'
export NIX_SHOW_WARNINGS=0
#nix-env --quiet -qaP '.*ruby.*'
nix search nixpkgs ruby