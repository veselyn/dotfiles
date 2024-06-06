{
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.home;
in {
  imports = [
    ../1password.nix
    ../options.nix
    ../packages.nix
    ../programs
    ../shellAliases.nix
  ];

  home = {
    stateVersion = "24.05";

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
