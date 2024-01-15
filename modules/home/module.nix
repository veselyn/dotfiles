{
  config,
  lib,
  specialArgs,
  ...
} @ args: {
  imports = [
    ./options.nix
  ];

  options = with lib; {
    modules.home = {
      imports = mkOption {};
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
        imports = [./standalone] ++ cfg.imports;
        modules.home = let
          inherit (import ./options.nix args) options;
        in
          builtins.intersectAttrs options.modules.home cfg;
      };
    };
  };
}
