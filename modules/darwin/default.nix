{lib, ...}: {
  imports = [
    ./homebrew.nix
    ./services
    ./system.nix
    ./users.nix
  ];

  options = {
    modules.darwin = with lib; {
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
