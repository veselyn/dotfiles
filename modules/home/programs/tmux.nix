{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    historyLimit = 10000;
    keyMode = "vi";
    mouse = true;
    shortcut = "a";
    terminal = "xterm-kitty";

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
    ];

    extraConfig = ''
      set -g status off
      set -g renumber-windows on

      bind C-a send C-a
      bind C-h send C-h
      bind C-j send C-j
      bind C-k send C-k
      bind C-l send C-l
      bind C-\\ send C-\\

      bind c new-window -c "#{pane_current_path}"
      bind - split-window -c "#{pane_current_path}"
      bind \\ split-window -h -c "#{pane_current_path}"
      bind _ split-window -f -c "#{pane_current_path}"
      bind | split-window -f -h -c "#{pane_current_path}"
    '';
  };

  programs.zsh.oh-my-zsh = {
    plugins = ["tmux"];

    extraConfig = ''
      ZSH_TMUX_AUTOSTART=true
    '';
  };
}
