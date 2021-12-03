{
  extras = hackage:
    {
      packages = {
        haskell-nix24-repro = ./haskell-nix24-repro.nix;
        webdriver = ./.stack-to-nix.cache.0;
        };
      };
  resolver = "lts-18.18";
  modules = [
    ({ lib, ... }:
      { packages = {}; })
    { packages = {}; }
    ({ lib, ... }:
      { planned = lib.mkOverride 900 true; })
    ];
  }