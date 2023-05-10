_: {
  imports = [
    ./programs
  ];

  home = {
    stateVersion = "22.11";

    shellAliases = {
      ls = "ls --color=auto";
      v = "vim";
      vd = "vimdiff";
      vs = "vim -S Session.vim";
    };
  };

  xdg.enable = true;
}
