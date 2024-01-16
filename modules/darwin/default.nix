{lib, ...}: {
  imports = [
    ./homebrew.nix
    ./networking.nix
    ./programs
    ./services
    ./system.nix
    ./users.nix
  ];

  options = with lib; {
    modules.darwin = {
      hostName = mkOption {};
      user = mkOption {};
    };
  };

  config = {
    system.stateVersion = 4;
  };
}
