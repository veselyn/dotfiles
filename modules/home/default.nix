_: {
  imports = [
    ./programs
  ];

  home = {
    stateVersion = "23.05";

    shellAliases = {
      ls = "ls --color=auto";
      v = "vim";
      vd = "vimdiff";
      vs = "vim -S Session.vim";
    };
  };

  xdg.enable = true;
}
