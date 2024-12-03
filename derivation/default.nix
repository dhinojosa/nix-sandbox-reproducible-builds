{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "hello-world";
  src = null;

  buildCommand = ''
    echo "Hello, Nix!" > $out
  '';
}
