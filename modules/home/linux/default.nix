{config, ...}: let
  cfg = config.modules.home;
in {
  imports = [
    ../module.nix
  ];

  home-manager = {
    users.${cfg.user} = {
      imports = [
        ./i3.nix
        ./programs
        ./services
      ];
    };
  };
}
