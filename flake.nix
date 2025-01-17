{
  description = "Kickstart templates to get started building with Nix.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs @ {
    flake-parts,
    self,
    ...
  }: let
    lib = import ./lib {inherit inputs;};
  in
    flake-parts.lib.mkFlake {inherit inputs;} {
      flake = {
        templates = {
          bash = {
            description = "Kickstart Bash language module flake.";
            path = ./template/bash;
          };

          cpp-cmake = {
            description = "Kickstart C++ CMake project flake.";
            path = ./template/cpp-cmake;
          };

          darwin = {
            description = "Kickstart macOS development environment flake.";
            path = ./template/darwin;
          };

          go-mod = {
            description = "Kickstart Go language module flake.";
            path = ./template/go-mod;
          };

          go-pkg = {
            description = "Kickstart Go language package flake.";
            path = ./template/go-pkg;
          };

          home-manager = {
            description = "Kickstart Home Manager environment flake.";
            path = ./template/home-manager;
          };

          lua-app = {
            description = "Kickstart Lua application flake.";
            path = ./template/lua-app;
          };

          nixos-desktop = {
            description = "Kickstart NixOS desktop environment flake.";
            path = ./template/nixos-desktop;
          };

          nixos-minimal = {
            description = "Kickstart NixOS minimal environment flake.";
            path = ./template/nixos-minimal;
          };

          powershell = {
            description = "Kickstart Powershell application flake.";
            path = ./template/powershell;
          };

          python-app = {
            description = "Kickstart Python application flake.";
            path = ./template/python-app;
          };

          python-pkg = {
            description = "Kickstart Python package flake.";
            path = ./template/python-pkg;
          };

          ocaml = {
            description = "Kickstart OCaml package flake.";
            path = ./template/ocaml;
          };

          rust = {
            description = "Kickstart Rust package flake.";
            path = ./template/rust;
          };

          swiftpm = {
            description = "Kickstart Swift package flake.";
            path = ./template/swiftpm;
          };

          nodejs-backend = {
            description = "Kickstart Node.js backend package flake.";
            path = ./template/nodejs-backend;
          };

          nestjs = {
            description = "Kickstart NestJS application flake.";
            path = ./template/nestjs;
          };

          dart = {
            description = "Kickstart Dart package flake.";
            path = ./template/dart;
          };

          zig = {
            description = "Kickstart Zig package flake.";
            path = ./template/zig;
          };

          haskell = {
            description = "Kickstart Haskell package flake.";
            path = ./template/haskell;
          };

          vite-react = {
            description = "Kickstart Vite React package flake.";
            path = ./template/vite-react;
          };
        };
      };

      systems = ["aarch64-darwin" "aarch64-linux" "x86_64-linux" "x86_64-darwin"];

      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [just jq];
          };
        };

        formatter = pkgs.alejandra;

        packages = {
          example-bash = lib.flake.bash system;
          example-cpp-cmake = lib.flake.cpp-cmake system;
          example-darwin = lib.flake.darwin system;
          example-go-mod = lib.flake.go-mod system;
          example-go-pkg = lib.flake.go-pkg system;
          example-home-manager = lib.flake.home-manager system;
          example-lua-app = lib.flake.lua-app system;
          example-nixos-desktop-gnome = lib.flake.nixos-desktop system "gnome";
          example-nixos-desktop-plasma5 = lib.flake.nixos-desktop system "plasma5";
          example-nixos-hardware = lib.flake.nixos-hardware system;
          example-nixos-minimal = lib.flake.nixos-minimal system;
          example-nodejs-backend = lib.flake.nodejs-backend system;
          example-nestjs = lib.flake.nestjs system;
          example-ocaml = lib.flake.ocaml system;
          example-powershell = lib.flake.powershell system;
          example-python-app = lib.flake.python-app system;
          example-python-pkg = lib.flake.python-pkg system;
          example-rust = lib.flake.rust system;
          example-swiftpm = lib.flake.swiftpm system;
          example-dart = lib.flake.dart system;
          example-zig = lib.flake.zig system;
          example-haskell = lib.flake.haskell system;
          example-vite-react = lib.flake.vite-react system;
        };
      };
    };
}
