{lib, ...}: {
  imports = [
    ./homebrew.nix
    ./services
    ./system.nix
    ./users.nix
  ];

  options = with lib; {
    modules.darwin = {
      user = mkOption {};
    };
  };

  config = {
    environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

    services.nix-daemon.enable = true;

    programs.zsh = {
      enable = true;
      promptInit = "";
    };

    system.stateVersion = 4;
  };
}
