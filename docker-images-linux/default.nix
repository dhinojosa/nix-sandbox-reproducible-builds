{ pkgs ? import <nixpkgs> {} }:

pkgs.dockerTools.buildImage {
  name = "my-htop";

  contents = pkgs.htop;

  # Docker image configuration
  config = {
    Cmd = [ "/bin/htop" ];  # Run the htop binary
  };
}
