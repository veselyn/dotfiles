{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
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

      plugins = let
        open = {
          plugin = pkgs.tmuxPlugins.open;
          extraConfig = ''
            set -g @open o
            set -g @open-editor C-o
            set -g @open-S https://www.google.com/search?q=
          '';
        };
      in
        builtins.attrValues {
          inherit
            (pkgs.tmuxPlugins)
            sessionist
            tmux-thumbs
            vim-tmux-navigator
            ;
          inherit open;
        };

      extraConfig = ''
        set -g default-command $SHELL

        set -g status off
        set -g renumber-windows on

        bind C-a send C-a
        bind C-h send C-h
        bind C-j send C-j
        bind C-k send C-k
        bind C-l send C-l
        bind C-\\ send C-\\

        bind c new-window -c '#{pane_current_path}'
        bind - split-window -c '#{pane_current_path}'
        bind \\ split-window -h -c '#{pane_current_path}'
        bind _ split-window -f -c '#{pane_current_path}'
        bind | split-window -f -h -c '#{pane_current_path}'

        bind -n C-/ select-window -l
        bind -n C-_ select-window -l
        bind C-/ send C-/
        bind C-_ send C-_

        bind -n C-s switch-client -l
        bind C-s send C-s
      '';
    };

    programs.zsh.oh-my-zsh = {
      plugins = ["tmux"];
    };
  };
}
