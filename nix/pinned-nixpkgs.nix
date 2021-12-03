
let
  params = import ./pinned-nixpkgs-src.nix;

  # nixpkgs = /home/tom/tools/nixpkgs;

  nixpkgs = builtins.fetchGit {
    url = params.url;
    rev = params.rev;
  };

  dockerToolsOverlay = self: super: {
    dockerTools = super.callPackage ./docker {
      writePython3 = super.buildPackages.writers.writePython3;
    };
  };

  nix24Nixpkgs = import (builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs.git";
    rev = "5b80f23502f8e902612a8c631dfce383e1c56596";
    ref = "release-21.11";
  }) {};
  nixOverlay = self: super: {
    nix = nix24Nixpkgs.nix_2_4;
  };

  # Replace the rclone in nixpkgs with our version that builds the shared library instead,
  # needed for haskell-rclone.
  # This works well because the haskell.nix materialization automatically adds "pkgs.rclone"
  # as a lib for haskell-rclone, so this causes our lib to be picked up when linking it.
  rcloneOverlay = self: super: {
    rclone = super.callPackage ./librclone.nix {};
    rcloneBin = super.rclone;
  };

in

{...}@args:

import nixpkgs ({
  overlays = (args.overlays or []) ++ [
    dockerToolsOverlay
    rcloneOverlay
    nixOverlay
  ];
} // (builtins.removeAttrs args ["overlays"]))
