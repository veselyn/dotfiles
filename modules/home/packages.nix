{pkgs, ...}:
with pkgs; {
  home.packages = lib.flatten (builtins.attrValues {
    coreutils = [
      coreutils-full
      findutils
      findutils.locate
      gnugrep
      gnumake
      gnused
      gnutar
      inetutils
      time
    ];
    scripts = with own; [
      gitpick
      yabaictl
    ];
    others = [
      _1password
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
    ];
  });
}
