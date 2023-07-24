_: {
  imports = [
    ../common
    ./fonts.nix
    ./homebrew.nix
    ./services
    ./system.nix
  ];

  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  services.nix-daemon.enable = true;

  programs.zsh = {
    enable = true;
    promptInit = "";
  };

  system.stateVersion = 4;
}
