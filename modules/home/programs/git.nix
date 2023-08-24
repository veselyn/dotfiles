_: {
  programs.git = {
    enable = true;

    lfs.enable = true;

    userName = "Veselin Ivanov";
    userEmail = "me@veselyn.com";

    signing = {
      key = "415F6249A29FEB3F";
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
