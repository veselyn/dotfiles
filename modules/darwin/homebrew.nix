{config, ...}: let
  cfg = config.homebrew;
in {
  homebrew = {
    enable = true;

    casks = [
      "1password"
      "dash"
      "discord"
      "docker"
      "firefox"
      "google-chrome"
      "kitty"
      "monitorcontrol"
      "skim"
      "sony-ps-remote-play"
      "tailscale"
      "utm"
      "vmware-fusion"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      Ghostery = 1436953057;
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
    source <(${cfg.brewPrefix}/brew shellenv)
  '';

  programs.zsh.interactiveShellInit = ''
    fpath+=${builtins.dirOf cfg.brewPrefix}/share/zsh/site-functions
  '';
}
