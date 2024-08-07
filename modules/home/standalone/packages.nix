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
    scripts = [
      battery
      flushdns
      gitpick
      yabaictl
    ];
    others = [
      _1password
      alejandra
      black
      cachix
      cargo
      cargo-modules
      cargo-watch
      clippy
      cloc
      devenv
      fd
      gcc
      go
      gofumpt
      golangci-lint
      gotools
      grc
      highlight
      httpie
      just
      kubectl
      kubectx
      lazydocker
      luaPackages.luacheck
      luajit
      mypy
      neofetch
      nix-init
      nodePackages.eslint
      nodePackages.prettier
      nodejs
      parallel
      pre-commit
      pylint
      python3
      python3Packages.pip
      ripgrep
      rustc
      rustfmt
      sd
      shellcheck
      shfmt
      silver-searcher
      statix
      stylua
      tree
      treefmt
      watch
      wget
    ];
  });
}
