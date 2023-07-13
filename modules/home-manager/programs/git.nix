_: {
  programs.git = {
    enable = true;

    lfs.enable = true;

    userName = "Veselin Ivanov";
    userEmail = "v3s1ez@gmail.com";

    signing = {
      key = "B09DDF9D424E10D3";
      signByDefault = true;
    };

    extraConfig = {
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

    diff-so-fancy.enable = true;
  };
}
