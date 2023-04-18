{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    escapeTime = 0;
    keyMode = "vi";
    shortcut = "a";
    terminal = "xterm-kitty";
    plugins = [
      pkgs.tmuxPlugins.vim-tmux-navigator
    ];
    extraConfig = ''
      set -g mouse on
      set -g status off

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
}
