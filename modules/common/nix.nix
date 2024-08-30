{
  config,
  inputs,
  pkgs,
  ...
}: let
  cfg = config.modules.common;
in {
  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];

    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };

    optimise.automatic = true;

    registry = {
      nixpkgs = {
        flake = cfg.nixpkgs;
      };

      nixpkgs-unstable = {
        flake = inputs.nixpkgs-unstable;
      };

      nixpkgs-stable = {
        flake = inputs.nixpkgs-stable;
      };

      nixpkgs-master = {
        flake = inputs.nixpkgs-master;
      };
    };
  };
}
