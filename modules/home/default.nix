{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [
    ../common
    ./packages.nix
    ./programs
  ];

  options = with lib; {
    modules.home = {
      user = mkOption {};
    };
  };

  config = let
    cfg = config.modules.home;
  in {
    home = {
      stateVersion = "23.05";

      username = cfg.user;
      homeDirectory = let
        directory =
          if pkgs.stdenv.isDarwin
          then "/Users"
          else "/home";
      in "${directory}/${cfg.user}";

      shellAliases = {
        ls = "ls --color=auto";
        v = "vim";
        vd = "vimdiff";
        vs = "vim -S Session.vim";
      };
    };

    xdg.enable = true;
  };
}
