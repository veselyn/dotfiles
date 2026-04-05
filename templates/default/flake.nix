{
  description = "default";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts/main";
    devenv.url = "github:cachix/devenv/latest";
    treefmt-nix.url = "github:numtide/treefmt-nix/main";
    treefmt-nix.inputs.nixpkgs.follows = "nixpkgs";
    git-hooks.url = "github:cachix/git-hooks.nix/master";
    git-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux"];

      perSystem = {pkgs, ...}: {
        devShells.default = inputs.devenv.lib.mkShell {
          inherit inputs pkgs;

          modules = [
            {
              languages = {
                nix.enable = true;
              };

              packages = builtins.attrValues {
                inherit
                  (pkgs)
                  pre-commit
                  ;
              };

              treefmt = {
                enable = true;
                config = {
                  programs = {
                    alejandra.enable = true;
                  };
                };
              };

              git-hooks.hooks = {
                deadnix.enable = true;
                end-of-file-fixer.enable = true;
                statix.enable = true;
                treefmt.enable = true;
                trim-trailing-whitespace.enable = true;
              };
            }
          ];
        };
      };
    };
}
