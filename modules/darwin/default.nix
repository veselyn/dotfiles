{ pkgs, ... }:

{
  imports = [
    ./services
  ];

  environment = {
    darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";
    systemPackages =
      [
        pkgs._1password
        pkgs.awscli2
        pkgs.buf
        pkgs.coreutils-full
        pkgs.docker
        pkgs.fd
        pkgs.findutils
        pkgs.findutils.locate
        pkgs.gnugrep
        pkgs.gnumake
        pkgs.gnused
        pkgs.gnutar
        pkgs.go
        pkgs.gofumpt
        pkgs.golangci-lint
        pkgs.gotools
        pkgs.httpie
        pkgs.inetutils
        pkgs.kubectl
        pkgs.luaPackages.luacheck
        pkgs.mkcert
        pkgs.neofetch
        pkgs.nixpkgs-fmt
        pkgs.nodePackages.eslint
        pkgs.nodePackages.prettier
        pkgs.nodejs
        pkgs.ranger
        pkgs.ripgrep
        pkgs.rustup
        pkgs.sd
        pkgs.shellcheck
        pkgs.shfmt
        pkgs.silver-searcher
        pkgs.sqlfluff
        pkgs.sshuttle
        pkgs.statix
        pkgs.stylua
        pkgs.terraform
        pkgs.time
        pkgs.vim-vint
        pkgs.watch
      ];
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

  homebrew = {
    enable = true;
    brews =
      [
        "nss"
      ];
    casks =
      [
        "1password"
        "airtame"
        "dash"
        "docker"
        "firefox"
        "kitty"
        "slack"
      ];
  };

  nix = {
    settings = {
      experimental-features =
        [
          "nix-command"
          "flakes"
        ];
    };
  };

  nixpkgs = {
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
