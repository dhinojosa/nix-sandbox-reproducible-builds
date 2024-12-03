{
   pkgs23_11 ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz") {},
   pkgs24_05 ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/refs/tags/24.05.tar.gz") {}
}:

pkgs24_05.mkShell {
  buildInputs = [
    pkgs23_11.neovim
    pkgs24_05.rustc
    pkgs24_05.kubectl
  ];
}
