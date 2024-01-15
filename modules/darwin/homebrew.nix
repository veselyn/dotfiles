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
      Kindle = 302584613;
      Xcode = 497799835;
    };
  };

  environment.extraInit = ''
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}
