{
  config,
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

      plugins = [
        "fzf"
        "git"
        "jump"
        "macos"
        "tmux"
        "web-search"
      ];

      extraConfig = ''
        ZSH_TMUX_AUTOSTART=true
        ZSH_TMUX_CONFIG=${config.xdg.configFile."tmux/tmux.conf".source}
      '';
    };

    shellAliases = {
      gai = "ga --interactive";
      gdn = "gd --no-ext-diff";
      gdcan = "gdca --no-ext-diff";
      gdcwn = "gdcw --no-ext-diff";
      gdsn = "gds --no-ext-diff";
      gdtn = "gdt --no-ext-diff";
      gdupn = "gdup --no-ext-diff";
      gdwn = "gdw --no-ext-diff";
    };

    initExtra = ''
      bindkey ^N down-line-or-beginning-search
      bindkey ^P up-line-or-beginning-search
    '';
  };
}
