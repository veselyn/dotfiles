{
  config,
  pkgs,
  ...
}: let
  inherit (pkgs) lib;
  cfg = config.modules.darwin;
in {
  users.users = {
    ${cfg.user} = {
      home = "/Users/${cfg.user}";
      openssh.authorizedKeys.keys = [lib.own.sshKeys.master];
    };
  };
}
