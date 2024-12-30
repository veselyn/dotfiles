{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.darwin;
in {
  config = lib.mkIf cfg.enable {
    homebrew = {
      enable = true;

      casks = [
        "1password"
        "chatgpt"
        "dash@6"
        "discord"
        "docker"
        "firefox"
        "google-chrome"
        "keyboardcleantool"
        "kitty"
        "monitorcontrol"
        "skim"
        "tailscale"
        "utm"
        "vmware-fusion"
      ];

      masApps = {
        "1Password for Safari" = 1569813296;
        Ghostery = 6504861501;
        Keynote = 409183694;
        Kindle = 302584613;
        Numbers = 409203825;
        Pages = 409201541;
        Translator = 1518955356;
        Vimari = 1480933944;
        Xcode = 497799835;
      };
    };

    environment.extraInit = ''
      source <(${config.homebrew.brewPrefix}/brew shellenv)
    '';

    programs.zsh.interactiveShellInit = ''
      fpath+=${builtins.dirOf config.homebrew.brewPrefix}/share/zsh/site-functions
    '';
  };
}
