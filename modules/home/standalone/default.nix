{
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.home;
in {
  imports = [
    ../options.nix
    ./1password.nix
    ./docker.nix
    ./packages.nix
    ./programs
    ./shellAliases.nix
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
