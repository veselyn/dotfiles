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

      userName = "Veselin Ivanov";
      userEmail = "me@veselyn.com";

      signing = {
        key = toplevel.self.keys.ssh.master;
        signByDefault = true;
      };

      extraConfig = {
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
      };

      ignores = [
        "Session.vim"
      ];

      delta = {
        enable = true;
        options = {
          diff-so-fancy = true;
        };
      };
    };

    programs.zsh.oh-my-zsh = {
      plugins = ["git"];
    };
  };
}
