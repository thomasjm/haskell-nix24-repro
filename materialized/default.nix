{
  extras = hackage:
    { packages = { haskell-nix24-repro = ./haskell-nix24-repro.nix; }; };
  resolver = "lts-18.18";
  modules = [
    ({ lib, ... }:
      { packages = {}; })
    { packages = {}; }
    ({ lib, ... }:
      { planned = lib.mkOverride 900 true; })
    ];
  }