{
  haskellNix ? import (builtins.fetchTarball "https://github.com/input-output-hk/haskell.nix/archive/d231ee71dc511806ff75a6d83c7481fa25bbf8fe.tar.gz") {}

, nixpkgsArgs ? haskellNix.nixpkgsArgs

, pkgs ? import ./nix/pinned-nixpkgs.nix nixpkgsArgs

, checkMaterialization ? true
}:

with pkgs;

let
  gitignoreSource = callPackage ./nix/hercules-gitignore.nix {};

  src = gitignoreSource ./.;

  filterSubdir = subDir: pkgs.haskell-nix.haskellLib.cleanSourceWith { inherit src subDir; };

in

haskell-nix.stackProject {
  inherit src;

  stack-sha256 = "0sjy3kphhbmbxp1flw0njvwpl57yhxys3542bics0zalrl72kn8c";
  materialized = ./materialized;
  inherit checkMaterialization;

  modules = [
    (lib.recursiveUpdate {} {})
  ];
}
