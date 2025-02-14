{
  description = "A lightweight library for building rich, interactive terminal user interfaces";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs?ref=staging-next";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      nixpkgs.lib.fix (
        flake:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          callPackage = pkgs.newScope (flake.packages // { inherit callPackage; });
        in
        {
          packages = {
            node = pkgs.nodejs; # needed for esbuild
            direnv = pkgs.direnv;
            nix-direnv = pkgs.nix-direnv;
          };

          devShell = callPackage ./devShell.nix {
            mkShell = pkgs.mkShellNoCC;
            packages = flake.packages;
          };
        }
      )
    );
}
