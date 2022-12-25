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
        ".vim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/private/dotfiles/vim";
      };
    };
    xdg = {
      configFile = {
        skhd.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/private/dotfiles/config/skhd";
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
      };
    };
  };
}
