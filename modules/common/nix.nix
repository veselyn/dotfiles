{
  inputs,
  pkgs,
  ...
}: {
  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];

    registry = {
      nixpkgs = {
        flake = inputs.nixpkgs;
      };

      nixpkgs-stable = {
        flake = inputs.nixpkgs-stable;
      };
    };
  };
}
