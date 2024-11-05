_: {
  flake.modules.darwin.default = ./darwin;
  flake.modules.darwin.home = ./darwin/home;

  flake.modules.generic.default = ./generic;
  flake.modules.generic.home = ./generic/home;

  flake.modules.home.darwin = ./home/darwin;
  flake.modules.home.linux = ./home/linux;

  flake.modules.nixos.default = ./nixos;
  flake.modules.nixos.home = ./nixos/home;
}
