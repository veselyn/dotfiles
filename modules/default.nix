_: {
  flake.modules = {
    darwin = {
      default = ./darwin;
      home = ./darwin/home;
    };

    generic = {
      default = ./generic;
      home = ./generic/home;
    };

    home = {
      darwin = ./home/darwin;
      linux = ./home/linux;
    };

    nixos = {
      default = ./nixos;
      home = ./nixos/home;
    };
  };
}
