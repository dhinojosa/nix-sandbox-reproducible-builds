# simple.nix
# From https://book.divnix.com/ch06-01-simple-c-program.html
let
  pkgs = import <nixpkgs> { };
in
  pkgs.stdenv.mkDerivation {
    name = "hello-nix";

    src = ./.;

    buildPhase = ''
      $CC simple.c -o hello_nix
    '';

    installPhase = ''
      mkdir -p $out/bin
      cp hello_nix  $out/bin/hello_nix
    '';
  }
