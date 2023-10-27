{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../options.nix
    ../packages.nix
    ../programs
  ];

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
        s = "echo $SHLVL";
        v = "vim";
        vd = "vimdiff";
        vs = "vim -S Session.vim";
      };
    };

    xdg.enable = true;
  };
}
