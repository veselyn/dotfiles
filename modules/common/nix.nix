{
  inputs,
  pkgs,
  ...
}: {
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
        flake = inputs.nixpkgs;
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
