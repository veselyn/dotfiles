{ pkgs, ... }:

let
  coreutils = [
    pkgs.coreutils-full
    pkgs.findutils
    pkgs.findutils.locate
    pkgs.gnugrep
    pkgs.gnumake
    pkgs.gnused
    pkgs.gnutar
    pkgs.inetutils
    pkgs.time
  ];
  ale = {
    linters = [
      pkgs.buf
      pkgs.golangci-lint
      pkgs.luaPackages.luacheck
      pkgs.nodePackages.eslint
      pkgs.rustup
      pkgs.shellcheck
      pkgs.sqlfluff
      pkgs.statix
      pkgs.vim-vint
    ];
    fixers = [
      pkgs.buf
      pkgs.gofumpt
      pkgs.nixpkgs-fmt
      pkgs.nodePackages.prettier
      pkgs.rustup
      pkgs.shfmt
      pkgs.sqlfluff
      pkgs.stylua
      pkgs.terraform
    ];
  };
  others = [
    pkgs._1password
    pkgs.awscli2
    pkgs.buf
    pkgs.docker
    pkgs.fd
    pkgs.go
    pkgs.gotools
    pkgs.httpie
    pkgs.kubectl
    pkgs.mkcert
    pkgs.neofetch
    pkgs.nodejs
    pkgs.ranger
    pkgs.ripgrep
    pkgs.sd
    pkgs.silver-searcher
    pkgs.sshuttle
    pkgs.terraform
    pkgs.watch
  ];
in
{
  environment.systemPackages = coreutils
    ++ ale.linters
    ++ ale.fixers
    ++ others;
}
