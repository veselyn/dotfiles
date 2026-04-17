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
        "bambu-studio"
        "betterdisplay"
        "chatgpt"
        "dash@6"
        "discord"
        "docker-desktop"
        "firefox"
        "google-chrome"
        "keyboardcleantool"
        "skim"
        "tailscale-app"
        "utm"
        "vmware-fusion"
      ];

      masApps = {
        "1Password for Safari" = 1569813296;
        Flow = 1423210932;
        Ghostery = 6504861501;
        Keynote = 409183694;
        Kindle = 302584613;
        Numbers = 409203825;
        Pages = 409201541;
        TimeOut = 402592703;
        Translator = 1518955356;
        Vimari = 1480933944;
        Xcode = 497799835;
        lire = 1482527526;
      };
    };

    environment.extraInit = ''
      source <(${config.homebrew.prefix}/bin/brew shellenv)
    '';

    programs.zsh.interactiveShellInit = ''
      fpath+=${builtins.dirOf config.homebrew.prefix}/share/zsh/site-functions
    '';
  };
}
