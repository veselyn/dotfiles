{config, ...}: {
  imports = [
    ./programs
  ];

  home = {
    stateVersion = "22.11";

    file = {
      ".vim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/vim";
    };

    shellAliases = {
      ls = "ls --color=auto";
      v = "vim";
      vd = "vimdiff";
      vs = "vim -S Session.vim";
    };
  };

  xdg.enable = true;
}
