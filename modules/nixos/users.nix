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
        hashedPassword = "$y$j9T$dZDOhoXlRzBfK/0KJNQq4.$bv.nHk0NmvBSSi.bcVeFgL62vv9z0xK36RJvz1i8uEB";
      };
    };
  };
}
