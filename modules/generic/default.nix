{
  config,
  lib,
  pkgs,
  toplevel,
  ...
}: let
  cfg = config.self.modules.generic;
in {
  options = {
    self.modules.generic = {
      enable = lib.mkEnableOption "generic";
    };
  };

  config = lib.mkIf cfg.enable {
    nix.package = pkgs.nix;
    nix.registry = {
      nixpkgs-unstable.flake = toplevel.inputs.nixpkgs;
      nixpkgs-stable.flake = toplevel.inputs.nixpkgs-stable;
      nixpkgs-master.flake = toplevel.inputs.nixpkgs-master;
    };
    nix.settings.experimental-features = ["nix-command" "flakes"];
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = builtins.attrValues toplevel.self.overlays;
  };
}
