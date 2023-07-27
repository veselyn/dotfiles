{
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.nixos;
in {
  users.users = {
    ${cfg.user} = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      shell = pkgs.zsh;
    };
  };
}
