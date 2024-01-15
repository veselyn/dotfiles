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
      yabaictl
    ];
    others = [
      _1password
      alejandra
      black
      cargo
      cargo-watch
      clippy
      cloc
      docker
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
      sqlfluff
      statix
      stylua
      tree
      watch
      wget
    ];
  });
}
