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
          "fzf"
          "git"
          "jump"
          "tmux"
          "web-search"
        ]
        ++ lib.optional pkgs.stdenv.isDarwin "macos";

      extraConfig = ''
        ZSH_TMUX_AUTOSTART=true
      '';
    };

    shellAliases = {
      gai = "ga --interactive";
    };

    initExtra = ''
      bindkey ^N down-line-or-beginning-search
      bindkey ^P up-line-or-beginning-search
    '';
  };
}
