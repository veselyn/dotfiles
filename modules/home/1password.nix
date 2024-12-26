{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;

  socketPath = "${config.home.homeDirectory}/.1password/agent.sock";
in {
  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      SSH_AUTH_SOCK =
        if pkgs.stdenv.isDarwin
        then socketPath
        else "\${SSH_AUTH_SOCK:-${socketPath}}";
    };

    home.file.${socketPath} = {
      enable = pkgs.stdenv.isDarwin;
      source = let
        socketPath = "${config.home.homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
      in
        config.lib.file.mkOutOfStoreSymlink socketPath;
    };
  };
}
