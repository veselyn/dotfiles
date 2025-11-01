{
  config,
  lib,
  toplevel,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;

      lfs.enable = true;

      settings = {
        commit = {
          verbose = true;
        };
        gpg = {
          format = "ssh";
        };
        init = {
          defaultBranch = "master";
        };
        merge = {
          tool = "vimdiff";
        };
        pull = {
          ff = "only";
        };
        user = {
          email = "me@veselyn.com";
          name = "Veselin Ivanov";
        };
      };

      signing = {
        key = toplevel.self.keys.ssh.master;
        signByDefault = true;
      };

      ignores = [
        "Session.vim"
      ];
    };

    programs.zsh.oh-my-zsh = {
      plugins = ["git"];
    };
  };
}
