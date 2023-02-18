_:

{
  programs.git = {
    enable = true;
    userName = "Veselin Ivanov";
    userEmail = "v3s1ez@gmail.com";
    signing = {
      key = "B09DDF9D424E10D3";
      signByDefault = true;
    };
    extraConfig = {
      merge = {
        tool = "vimdiff";
      };
    };
    ignores =
      [
        ".vimrc"
        "Session.vim"
      ];
  };
}