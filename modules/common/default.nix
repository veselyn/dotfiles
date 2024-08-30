{lib, ...}: {
  imports = [
    ./nix.nix
    ./nixpkgs.nix
  ];

  options = with lib; {
    modules.common = {
      nixpkgs = mkOption {};
    };
  };
}
