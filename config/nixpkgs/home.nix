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
        kitty.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/private/dotfiles/config/kitty";
        yabai.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/private/dotfiles/config/yabai";
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
              # TODO: Enable once tmux is set up.
              # "tmux"
              "web-search"
              "z"
            ];
        };
      };
      tmux = {
        enable = true;
      };
      fzf = {
        enable = true;
      };
    };
  };
}
