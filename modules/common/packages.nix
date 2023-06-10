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
      cargo-watch
      cloc
      docker
      fd
      go
      gotools
      grc
      highlight
      httpie
      kubectl
      kubectx
      mkcert
      neofetch
      nodejs
      parallel
      python3
      ripgrep
      sd
      silver-searcher
      sshuttle
      terraform
      watch
    ];
  });
}
