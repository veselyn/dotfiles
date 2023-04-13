{ config, ... }:

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
    sessionPath = [
      "${config.home.file."bin".source}"
    ];
    shellAliases = {
      ls = "ls --color=auto";
      v = "vim";
      vd = "vimdiff";
      vs = "vim -S Session.vim";
    };
  };
  xdg = {
    enable = true;
  };
}
