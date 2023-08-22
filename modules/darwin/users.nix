{config, ...}: let
  cfg = config.modules.darwin;
in {
  users.users = {
    ${cfg.user} = {
      home = "/Users/${cfg.user}";
    };
  };
}
