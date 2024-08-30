{pkgs, ...}: let
  inherit (pkgs) lib;
in {
  programs.git = {
    enable = true;

    lfs.enable = true;

    userName = "Veselin Ivanov";
    userEmail = "me@veselyn.com";

    signing = {
      key = lib.own.sshKeys.master;
      signByDefault = true;
    };

    extraConfig = {
      gpg = {
        format = "ssh";
        ssh = {
          program =
            if pkgs.stdenv.isDarwin
            then "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
            else "${pkgs._1password-gui}/bin/op-ssh-sign";
        };
      };
      init = {
        defaultBranch = "master";
      };
      merge = {
        tool = "vimdiff";
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
}
