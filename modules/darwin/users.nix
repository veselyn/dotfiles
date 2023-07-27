{config, ...}: let
  cfg = config.modules.darwin;
in {
  users.users = {
    ${cfg.user} = {};
  };
}
