{pkgs, ...}:
with pkgs; {
  environment.systemPackages = lib.flatten (builtins.attrValues {
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
      awscli2
      buf
      cargo
      cargo-watch
      clippy
      cloc
      docker
      fd
      gcc
      go
      gotools
      grc
      highlight
      httpie
      kubectl
      kubectx
      luajit
      mkcert
      neofetch
      nodejs
      parallel
      python3
      ripgrep
      rustc
      rustfmt
      sd
      silver-searcher
      sshuttle
      terraform
      watch
    ];
  });
}
