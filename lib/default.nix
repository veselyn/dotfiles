{lib, ...}: {
  imports = [
    ./configs.nix
    ./pkgs.nix
  ];

  options = {
    flake.lib = lib.mkOption {
      type = lib.types.attrs;
    };
  };
}
