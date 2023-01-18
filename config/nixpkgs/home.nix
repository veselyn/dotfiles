{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  users = {
    users = {
      veselin = {
        name = "veselin";
        home = "/Users/veselin";
      };
    };
  };

  home-manager = {
    users = {
      veselin = { config, pkgs, ... }: {
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
          };
          packages =
            [
              pkgs._1password
              pkgs.awscli2
              pkgs.fd
              pkgs.go
              pkgs.highlight
              pkgs.httpie
              pkgs.kubectl
              pkgs.neofetch
              pkgs.nodejs
              pkgs.ranger
              pkgs.ripgrep
              pkgs.silver-searcher
              pkgs.sshuttle
            ];
        };
        nixpkgs = {
          config = {
            allowUnfree = true;
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
            plugins =
              [
                pkgs.tmuxPlugins.vim-tmux-navigator
              ];
            extraConfig = ''
              set -g mouse on
              set -g status off

              bind C-a send C-a
              bind C-h send C-h
              bind C-j send C-j
              bind C-k send C-k
              bind C-l send C-l
              bind C-\\ send C-\\

              bind c new-window -c "#{pane_current_path}"
              bind - split-window -c "#{pane_current_path}"
              bind \\ split-window -h -c "#{pane_current_path}"
              bind _ split-window -f -c "#{pane_current_path}"
              bind | split-window -f -h -c "#{pane_current_path}"
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
          };
          ssh = {
            enable = true;
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
        };
        xdg = {
          enable = true;
        };
      };
    };
  };
}
