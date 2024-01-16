{lib, ...}: {
  imports = [
    ./homebrew.nix
    ./networking.nix
    ./services
    ./users.nix
  ];

  options = with lib; {
    modules.darwin = {
      hostName = mkOption {};
      user = mkOption {};
    };
  };

  config = {
    services.nix-daemon.enable = true;

    programs.zsh = {
      enable = true;
      promptInit = "";
    };

    system.stateVersion = 4;
  };
}
