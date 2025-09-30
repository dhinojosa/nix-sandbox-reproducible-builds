{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "my-htop";
  tag  = "1.0.0";

  # buildEnv is to build multiple derviations in one
  copyToRoot = pkgs.buildEnv {
    name = "image-root";
    paths = [ pkgs.htop ];
  };

  config = {
    Cmd = [ "/bin/htop" ];
  };
}