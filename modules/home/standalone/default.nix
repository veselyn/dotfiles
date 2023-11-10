{
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.home;
in {
  imports = [
    ../options.nix
    ../packages.nix
    ../programs
  ];

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
      gai = "git add --interactive";
      ls = "ls --color=auto";
      s = "echo $SHLVL";
      v = "vim";
      vd = "vimdiff";
      vs = "vim -S Session.vim";
    };
  };

  xdg.enable = true;
}
