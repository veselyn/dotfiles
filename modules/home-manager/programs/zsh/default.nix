{ config, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      plugins =
        [
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
  };
}
