# Nix Sandbox Reproducible Builds

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/dhinojosa/nix-sandbox-reproducible-builds)

## Description

This repository demonstrates the power of Nix for creating reproducible builds and development environments. Nix is a
powerful package manager and build system that enables purely functional software deployment. With Nix, you can create
isolated environments, ensure reproducible builds, and manage dependencies declaratively.

## Try It Out

You can experiment with this repository directly in your browser using cloud development environments:

- **GitHub Codespaces**: Click the "Open in GitHub Codespaces" button above to launch a fully configured development
  environment with Nix pre-installed.

These environments come with everything you need to run the examples and explore Nix's capabilities without any local
setup required.

## Demos

### Demo 1: `nixpkgs`

. Look at the `nixpkgs` repository and view all the derivation available. https://github.com/NixOS/nixpkgs
. Use nixpkgs search online to search for nix package derivations https://search.nixos.org/packages

### Demo 2: Trying some commands

```shell
$ cowsay no can do
$ echo no chance | lolcat
```

But, let us do something more meaningful.

```shell
$ nix-shell -p cowsay lolcat
$ cowsay no can do
$ echo no chance | lolcat
```

### Demo 3: Discovering the Nix Store

1. Go to the _/nix/store_ directory and explore the contents.
2. In particular, look for the _cowsay_, _lolcat_, and _nix-shell_ executables.

### Demo 4: Pinning

#### Demo 4.1: Pinning nixpkgs

1. Go to the _pinning_ directory and view the _default.nix_ file.
2. Notice that `pkgs` is pointing to a fixed version of `nixpkgs`. This is a reproducible build. It will always use the same version of `nixpkgs`.
3. The versions of packages in this _default.nix_ will always be tired to the same version of `nixpkgs`.

#### Demo 4.2: Pinning nixpkgs with a different channels

1. Go to the _pinning-dual-channels_ directory and view the _default.nix_ file.
2. Notice in this example, we are using different channels for different packages. 
3. `pkgs23_11.neovim`, `pkgs24_05.rustc`, `pkgs24_05.kubectl`

### Demo 5: Simple Derivations

1. Navigate to the _derivation_ directory.
2. Review the _default.nix_ file and its contents. 
3. Run the _build.sh_ script to build the derivation.
4. The script will build the derivation and execute it, displaying "Hello from Nix!".
5. Notice that the derivation is stored in the _result_ file in the directory.

### Demo 6: Compile Derivation Phase

1. Navigate to the _derivation-phase_ directory.
2. Examine the `simple.c` file containing a basic C program.
3. Review `simple.nix` which defines the build process using `mkDerivation`.
4. Run the build script:
   ```shell
   $ cd derivation-phase
   $ ./build.sh
   ```
5. The script will build the program and execute it, displaying "Hello from Nix!".

### Demo 7: Nix Flakes

1. Navigate to the _flake_ directory.
2. Open the _flake.nix_ file and review the contents. This is a derivation, just a different style. 
3. The _flake.lock_
   file is a lockfile that pins all dependencies to specific versions, ensuring reproducible builds. You should always
   commit this file to your repository to ensure everyone uses the same dependency versions. Open it to view the sha256
   versions of the file that you are using. 
4. To upgrade the versions in the lock file, you can run `nix flake update` in
   the directory containing the _flake.nix_ file. This will fetch the latest versions of all dependencies and update the
   lock file accordingly.
