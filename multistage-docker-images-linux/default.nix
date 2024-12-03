{ pkgs ? import <nixpkgs> {} }:

let
  # Stage 1: Build the application
  appBuild = pkgs.stdenv.mkDerivation {
    name = "my-app";
    src = ./src;

    buildInputs = [ pkgs.nodejs pkgs.yarn ]; # Example dependencies

    buildPhase = ''
      yarn install
      yarn build
    '';

    installPhase = ''
      mkdir -p $out
      cp -r dist $out/
    '';
  };

  # Stage 2: Create a Docker image with only the built application
  appImage = pkgs.dockerTools.buildImage {
    name = "my-app";
    contents = [ appBuild ];
    config = {
      Cmd = [ "node" "/dist/index.js" ];
    };
  };
in
  appImage
