{
  lib,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;

    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;

      theme = "robbyrussell";

      plugins =
        [
          "git"
          "jump"
          "web-search"
        ]
        ++ lib.optional pkgs.stdenv.isDarwin "macos";
    };

    initExtra = ''
      bindkey ^N down-line-or-beginning-search
      bindkey ^P up-line-or-beginning-search
    '';
  };
}
