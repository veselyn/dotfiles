{pkgs, ...}:
with pkgs; let
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
  linters = [
    buf
    golangci-lint
    luaPackages.luacheck
    nodePackages.eslint
    rustup
    shellcheck
    sqlfluff
    statix
    vim-vint
  ];
  fixers = [
    buf
    gofumpt
    alejandra
    nodePackages.prettier
    rustup
    shfmt
    sqlfluff
    stylua
    terraform
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
    htop
    httpie
    kubectl
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
in {
  environment.systemPackages = lib.flatten (builtins.attrValues {
    inherit coreutils;
    inherit linters;
    inherit fixers;
    inherit scripts;
    inherit others;
  });
}
