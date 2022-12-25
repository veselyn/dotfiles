{ config, pkgs, ... }:

{
  imports = [ <home-manager/nix-darwin> ];

  users.users.veselin = {
    name = "veselin";
    home = "/Users/veselin";
  };

  home-manager.users.veselin = {
    home = {
      username = "veselin";
      homeDirectory = "/Users/veselin";
      stateVersion = "22.11";
    };
  };
}
