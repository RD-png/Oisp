{
  description = "Oisp Flake";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            ocaml
            dune_3
            ocamlPackages.utop
            ocamlPackages.findlib
            ocamlPackages.core
          ];
        };
      });
}
