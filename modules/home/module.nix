{
  config,
  specialArgs,
  ...
}: let
  cfg = config.modules.home;
in {
  imports = [
    ./options.nix
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = specialArgs;

    users.${cfg.user} = {
      imports = [./standalone];
      modules.home = cfg;
    };
  };
}
