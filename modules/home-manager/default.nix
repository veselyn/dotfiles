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
  xdg = {
    enable = true;
  };
}
