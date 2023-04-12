{ self, pkgs, ... }:

{
  imports = [
    ../common
    ./services
  ];

  environment = {
    darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";
  };

  fonts = {
    fontDir = {
      enable = true;
    };
    fonts = [
      pkgs.nerdfonts
    ];
  };

  homebrew = {
    enable = true;
    brews = [
      "nss"
    ];
    casks = [
      "1password"
      "airtame"
      "dash"
      "docker"
      "firefox"
      "google-chrome"
      "kitty"
      "slack"
    ];
  };

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  nixpkgs = {
    overlays = builtins.attrValues self.overlays;
    config = {
      allowUnfree = true;
    };
  };

  programs = {
    zsh = {
      enable = true;
      promptInit = "";
    };
  };

  services = {
    nix-daemon = {
      enable = true;
    };
  };

  system = {
    defaults = {
      CustomUserPreferences = {
        "com.apple.Accessibility" = {
          ReduceMotionEnabled = 1;
        };
      };
      NSGlobalDomain = {
        "com.apple.keyboard.fnState" = true;
        AppleKeyboardUIMode = 3;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        _HIHideMenuBar = true;
      };
      dock = {
        autohide = true;
        mru-spaces = false;
        tilesize = 16;
      };
      magicmouse = {
        MouseButtonMode = "TwoButton";
      };
    };
    keyboard = {
      enableKeyMapping = true;
      nonUS = {
        remapTilde = true;
      };
      remapCapsLockToEscape = true;
    };
    stateVersion = 4;
  };
}
