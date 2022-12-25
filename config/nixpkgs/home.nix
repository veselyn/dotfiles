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
              # TODO: Separate private and work repositories.
              # "private"
              # "work"
              "asdf"
              "git"
              "jump"
              "macos"
              "tmux"
              "web-search"
              "z"
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
          set-option -g status off
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
        extraConfig = ''
          source ${config.home.file.".vim".source}/vimrc
        '';
      };
    };
  };
}
