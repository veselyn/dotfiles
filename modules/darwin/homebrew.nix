_: {
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
      "skim"
      "tailscale"
      "vmware-fusion"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      Keynote = 409183694;
      Kindle = 302584613;
      Numbers = 409203825;
      Pages = 409201541;
      Vimari = 1480933944;
      Xcode = 497799835;
    };
  };

  environment.extraInit = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}
