{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      autosuggestion.enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
        enable = true;

        theme = "robbyrussell";

        plugins =
          [
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
  };
}
