{ pkgs ? import <nixpkgs> {} }:

let
  appBuild = pkgs.stdenv.mkDerivation {
    name = "my-app";
    src = ./src;

    buildInputs = [ pkgs.nodejs pkgs.yarn ];

    buildPhase = ''
      yarn install
      yarn build
    '';

    installPhase = ''
      mkdir -p $out/dist
      cp -r dist/* $out/dist/
    '';
  };

  appImage = pkgs.dockerTools.buildImage {
    name = "my-app";
    tag = "1.0.0";

    copyToRoot = pkgs.buildEnv {
      name = "my-app-image-root";
      paths = [ pkgs.nodejs appBuild ];
    };

    config = {
      Cmd = [ "node" "/dist/index.js" ];
    };
  };
in
  appImage
