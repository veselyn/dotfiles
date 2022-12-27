{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  users.users.veselin = {
    name = "veselin";
    home = "/Users/veselin";
  };

  home-manager.users.veselin = { config, pkgs, ... }: {
    home = {
      username = "veselin";
      homeDirectory = "/Users/veselin";
      stateVersion = "22.11";
      file = {
        "bin".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/private/dotfiles/bin";
        ".vim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/private/dotfiles/vim";
      };
      sessionPath =
        [
          "${config.home.file."bin".source}"
        ];
      sessionVariables = {
        EDITOR = "vim";
        XDG_CACHE_HOME = config.xdg.cacheHome;
        XDG_CONFIG_HOME = config.xdg.configHome;
        XDG_DATA_HOME = config.xdg.dataHome;
        XDG_STATE_HOME = config.xdg.stateHome;
      };
    };
    programs = {
      zsh = {
        enable = true;
        enableAutosuggestions = true;
        enableCompletion = true;
        enableSyntaxHighlighting = true;
        oh-my-zsh = {
          enable = true;
          theme = "robbyrussell";
          plugins =
            [
              "fzf"
              "git"
              "jump"
              "macos"
              "tmux"
              "web-search"
            ];
          extraConfig = ''
            ZSH_TMUX_AUTOSTART=true
            ZSH_TMUX_CONFIG=${config.xdg.configFile."tmux/tmux.conf".source}
          '';
        };
      };
      tmux = {
        enable = true;
        baseIndex = 1;
        clock24 = true;
        customPaneNavigationAndResize = true;
        escapeTime = 0;
        keyMode = "vi";
        shortcut = "a";
        terminal = "xterm-kitty";
        extraConfig = ''
          set -g mouse on
          set -g status off

          bind-key -T prefix c new-window -c "#{pane_current_path}"
          bind-key -T prefix \% split-window -h -c "#{pane_current_path}"
          bind-key -T prefix \" split-window -c "#{pane_current_path}"
        '';
      };
      fzf = {
        enable = true;
      };
      kitty = {
        enable = true;
        font = {
          package = pkgs.nerdfonts;
          name = "MesloLGS Nerd Font";
          size = 13;
        };
        settings = {
          dynamic_background_opacity = "yes";
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
      };
      ssh = {
        enable = true;
        matchBlocks = {
          "*" = {
            extraOptions = {
              AddKeysToAgent = "yes";
              UseKeychain = "yes";
            };
          };
        };
      };
      gh = {
        enable = true;
      };
    };
  };
}
