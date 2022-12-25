{ config, pkgs, ... }:

{
  imports = [ ../home.nix ];

  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;
  system.keyboard.nonUS.remapTilde = true;

  system.defaults.NSGlobalDomain._HIHideMenuBar = true;
  system.defaults.NSGlobalDomain."com.apple.keyboard.fnState" = true;

  system.defaults.dock.tilesize = 16;
  system.defaults.dock.autohide = true;

  homebrew.enable = true;
  homebrew.casks =
    [
      "1password"
      "firefox"
      "kitty"
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  services = {
    yabai = {
      enable = true;
      config = {
        layout = "bsp";
        left_padding = 5;
        bottom_padding = 5;
        top_padding = 5;
        right_padding = 5;
        window_gap = 5;
      };
    };
    skhd = {
      enable = true;
    };
  };

  fonts = {
    fontDir = {
      enable = true;
    };
    fonts =
      [
        pkgs.nerdfonts
      ];
  };

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [
      pkgs._1password
      pkgs.neofetch
      pkgs.ranger
      pkgs.vim-full
    ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
