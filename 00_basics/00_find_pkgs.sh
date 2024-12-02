#!/bin/bash

# First update the channels

nix-channel --update

# To look for elements, you can run the following
# nix-env -qaP '*<search-term>*'

nix-env --quiet -qaP '.*JDK.*'
nix-env --quiet -qaP '.*openjdk.*'
nix-env --quiet -qaP '.*ruby.*'
