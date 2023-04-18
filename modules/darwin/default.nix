{
  self,
  pkgs,
  ...
}: {
  imports = [
    ../common
    ./fonts.nix
    ./homebrew.nix
    ./services
    ./system.nix
  ];

  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nix;
    settings.experimental-features = ["nix-command" "flakes"];
  };

  nixpkgs = {
    overlays = builtins.attrValues self.overlays;
    config.allowUnfree = true;
  };

  programs.zsh = {
    enable = true;
    promptInit = "";
  };

  system.stateVersion = 4;
}
