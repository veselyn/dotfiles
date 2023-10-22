{
  config,
  lib,
  specialArgs,
  ...
}: {
  options = with lib; {
    modules.home = {
      user = mkOption {};
    };
  };

  config = let
    cfg = config.modules.home;
  in {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;

      extraSpecialArgs = specialArgs;

      users.${cfg.user} = {
        imports = [./standalone.nix];
        modules.home.user = cfg.user;
      };
    };
  };
}
