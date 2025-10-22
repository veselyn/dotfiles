{lib, ...}: {
  imports = [
    ./argc.nix
    ./configs.nix
    ./per-system.nix
    ./pkgs.nix
  ];

  options = {
    flake.lib = lib.mkOption {
      type = lib.types.attrs;
    };
  };
}
