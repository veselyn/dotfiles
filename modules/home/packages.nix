{
  config,
  lib,
  perSystem,
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
      lnav
      nix-init
      parallel
      ripgrep
      rlwrap
      sd
      silver-searcher
      spacer
      tree
      treefmt
      watch
      wget
      ;
  };

  self = builtins.attrValues {
    inherit
      (perSystem.self'.packages)
      gitpick
      smux
      ;
  };
in {
  config = lib.mkIf cfg.enable {
    home.packages =
      coreutils
      ++ others
      ++ self;
  };
}
