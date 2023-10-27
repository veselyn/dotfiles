{
  config,
  specialArgs,
  ...
}: {
  imports = [
    ./options.nix
  ];

  config = let
    cfg = config.modules.home;
  in {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = specialArgs;

      users.${cfg.user} = {
        imports = [./standalone];
        modules.home = cfg;
      };
    };
  };
}
