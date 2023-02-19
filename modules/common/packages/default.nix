{ pkgs, ... }:

with pkgs;

let
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
    nixpkgs-fmt
    nodePackages.prettier
    rustup
    shfmt
    sqlfluff
    stylua
    terraform
  ];
  others = [
    _1password
    awscli2
    buf
    docker
    fd
    go
    gotools
    httpie
    kubectl
    mkcert
    neofetch
    nodejs
    ranger
    ripgrep
    sd
    silver-searcher
    sshuttle
    terraform
    watch
  ];
in
{
  environment.systemPackages = lib.flatten (builtins.attrValues {
    inherit coreutils;
    inherit linters;
    inherit fixers;
    inherit others;
  });
}
