{ config, pkgs, ... }:

{
  imports = [
    ./programs
  ];

  home = {
    stateVersion = "22.11";
    file = {
      "bin".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/bin";
      ".vim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/vim";
    };
    sessionPath =
      [
        "${config.home.file."bin".source}"
      ];
    sessionVariables = {
      EDITOR = "vim";
    };
    packages =
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
    shellAliases = {
      gai = "git add --interactive";
      r = "ranger";
      v = "vim";
      vd = "vimdiff";
      vs = "vim -S Session.vim";
    };
  };
  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };
  programs = {
    kitty = {
      enable = true;
      font = {
        package = pkgs.nerdfonts;
        name = "MesloLGS Nerd Font";
        size = 13;
      };
      settings = {
        dynamic_background_opacity = true;
        enable_audio_bell = false;
        hide_window_decorations = "titlebar-only";
        macos_option_as_alt = "both";
        mouse_hide_wait = -1;
      };
    };
    vim = {
      enable = true;
      packageConfigurable = pkgs.vim_configurable.override {
        guiSupport = false;
        darwinSupport = true;
      };
      extraConfig = ''
        source ${config.home.file.".vim".source}/vimrc
      '';
    };
    gpg = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "Veselin Ivanov";
      userEmail = "v3s1ez@gmail.com";
      signing = {
        key = "B09DDF9D424E10D3";
        signByDefault = true;
      };
      extraConfig = {
        merge = {
          tool = "vimdiff";
        };
      };
      ignores =
        [
          ".vimrc"
          "Session.vim"
        ];
    };
    ssh = {
      enable = true;
      forwardAgent = true;
      matchBlocks = {
        "*" = {
          extraOptions = {
            IgnoreUnknown = "UseKeychain";
            AddKeysToAgent = "yes";
            UseKeychain = "yes";
          };
        };
      };
    };
    gh = {
      enable = true;
      extensions =
        [
          pkgs.gh-dash
        ];
    };
    zoxide = {
      enable = true;
    };
    bat = {
      enable = true;
    };
    jq = {
      enable = true;
    };
    tealdeer = {
      enable = true;
    };
  };
  xdg = {
    enable = true;
  };
}
