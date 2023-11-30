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
    ../shellAliases.nix
  ];

  home = {
    stateVersion = "23.11";

    username = cfg.user;
    homeDirectory = let
      directory =
        if pkgs.stdenv.isDarwin
        then "/Users"
        else "/home";
    in "${directory}/${cfg.user}";
  };

  xdg.enable = true;
}
