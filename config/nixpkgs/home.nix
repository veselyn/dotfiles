{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  users.users.veselin = {
    name = "veselin";
    home = "/Users/veselin";
  };

  home-manager.users.veselin = { config, pkgs, ...}: {
    home = {
      username = "veselin";
      homeDirectory = "/Users/veselin";
      stateVersion = "22.11";
    };
    xdg = {
      configFile = {
        yabai.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/private/dotfiles/config/yabai";
        skhd.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/source/private/dotfiles/config/skhd";
      };
    };
  };
}
