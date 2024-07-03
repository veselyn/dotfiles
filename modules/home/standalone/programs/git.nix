{pkgs, ...}: {
  programs.git = {
    enable = true;

    lfs.enable = true;

    userName = "Veselin Ivanov";
    userEmail = "me@veselyn.com";

    signing = {
      key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJBKvLCEwUG+hT5G0PFIHLPJK/rM8EiPngEkAkvLmo22";
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
      pull = {
        rebase = true;
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
