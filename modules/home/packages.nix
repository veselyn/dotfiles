{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;

  coreutils = builtins.attrValues {
    inherit
      (pkgs)
      coreutils-full
      findutils
      gnugrep
      gnumake
      gnused
      gnutar
      inetutils
      time
      ;
    inherit (pkgs.findutils) locate;
  };

  others = builtins.attrValues {
    inherit
      (pkgs)
      _1password-cli
      cachix
      devenv
      fd
      httpie
      just
      kubectl
      kubectx
      lazydocker
      nix-init
      parallel
      ripgrep
      sd
      silver-searcher
      tree
      treefmt
      watch
      wget
      ;
  };
in {
  config = lib.mkIf cfg.enable {
    home.packages =
      coreutils
      ++ others;
  };
}
