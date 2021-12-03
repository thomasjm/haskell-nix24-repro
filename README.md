# haskell-nix24-repro

## Building with nix-build 2.3.16

``` sh
> nix-build -A stack-nix.passthru.updateMaterialized --no-out-link

trace: Checking materialization in /home/tom/tools/haskell-nix24-repro/materialized
building '/nix/store/6phz0dyzndmln3wav97x75irz3d7an5s-haskell-project-stack-to-nix-pkgs.drv'...
building '/nix/store/wnvqgg1qpk08w3xg3ndlibcn1gmw46ip-haskell-project-stack-to-nix-pkgs.drv'...
stack-sha256 used for haskell-project-stack-to-nix-pkgs is correct
materialized nix used for haskell-project-stack-to-nix-pkgs is correct
/nix/store/bfs207a876gbmirl1awyg99m7rxsi0ds-updateMaterialized
```
## Building with nix-build 2.4 (!)

``` sh
> nix-build -A stack-nix.passthru.updateMaterialized --no-out-link

trace: Checking materialization in /home/tom/tools/haskell-nix24-repro/materialized
building '/nix/store/1l7a0yxrg356q1n4i7mj7fxh0smgqa1z-haskell-project-stack-to-nix-pkgs.drv'...
building '/nix/store/6phz0dyzndmln3wav97x75irz3d7an5s-haskell-project-stack-to-nix-pkgs.drv'...
error: path '/nix/store/012r76kyra8z09qq9d6f40s7qc2m64fa-haskell-project-stack-to-nix-pkgs' is not valid
```
