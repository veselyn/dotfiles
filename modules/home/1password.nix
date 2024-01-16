{
  config,
  pkgs,
  ...
}: let
  inherit (config.home) homeDirectory;
  socketPath = "${homeDirectory}/.1password/agent.sock";
in {
  programs.ssh.matchBlocks."*".extraOptions = {
    IdentityAgent = socketPath;
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = socketPath;
  };

  home.file.${socketPath} = {
    enable = pkgs.stdenv.isDarwin;
    source = let
      socketPath = "${homeDirectory}/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock";
    in
      config.lib.file.mkOutOfStoreSymlink socketPath;
  };
}
