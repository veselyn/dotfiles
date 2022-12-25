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
      skhdConfig = ''
        alt - h : yabaiscript focus left
        alt - j : yabaiscript focus bottom
        alt - k : yabaiscript focus top
        alt - l : yabaiscript focus right

        shift + alt - h : yabaiscript swap left
        shift + alt - j : yabaiscript swap bottom
        shift + alt - k : yabaiscript swap top
        shift + alt - l : yabaiscript swap right

        shift + cmd - h : yabaiscript warp left
        shift + cmd - j : yabaiscript warp bottom
        shift + cmd - k : yabaiscript warp top
        shift + cmd - l : yabaiscript warp right

        shift + alt - backspace : yabaiscript space balance

        shift + alt - 1 : yabaiscript space 1
        shift + alt - 2 : yabaiscript space 2
        shift + alt - 3 : yabaiscript space 3
        shift + alt - 4 : yabaiscript space 4
        shift + alt - 5 : yabaiscript space 5
        shift + alt - 6 : yabaiscript space 6
        shift + alt - 7 : yabaiscript space 7
        shift + alt - 8 : yabaiscript space 8
        shift + alt - 9 : yabaiscript space 9
        shift + alt - 0 : yabaiscript space 10

        shift + ctrl - h : yabaiscript move left
        shift + ctrl - j : yabaiscript move bottom
        shift + ctrl - k : yabaiscript move top
        shift + ctrl - l : yabaiscript move right

        shift + alt + cmd - h : yabaiscript resize left
        shift + alt + cmd - j : yabaiscript resize bottom
        shift + alt + cmd - k : yabaiscript resize top
        shift + alt + cmd - l : yabaiscript resize right

        ctrl + alt - h : yabaiscript insert left
        ctrl + alt - j : yabaiscript insert bottom
        ctrl + alt - k : yabaiscript insert top
        ctrl + alt - l : yabaiscript insert right

        shift + alt - d : yabaiscript toggle zoom-parent
        shift + alt - f : yabaiscript toggle zoom-fullscreen

        alt - e : yabaiscript toggle split

        alt - t : yabaiscript toggle float;\
                yabaiscript grid center
      '';
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
      pkgs.highlight
      pkgs.neofetch
      pkgs.ranger
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
