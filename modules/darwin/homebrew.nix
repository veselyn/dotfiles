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
      "slack"
      "vmware-fusion"
    ];

    masApps = {
      "1Password for Safari" = 1569813296;
      Kindle = 302584613;
      Xcode = 497799835;
      Numbers = 409203825;
      Keynote = 409183694;
      Pages = 409201541;
    };
  };

  environment.extraInit = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}
