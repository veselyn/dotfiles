{
  config,
  pkgs,
  ...
}: let
  cfg = config.modules.nixos;
in {
  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      ${cfg.user} = {
        isNormalUser = true;
        extraGroups = ["wheel"];
      };
    };
  };
}
