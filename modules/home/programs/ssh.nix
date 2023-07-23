_: {
  programs.ssh = {
    enable = true;

    forwardAgent = true;

    matchBlocks = {
      "*" = {
        extraOptions = {
          IgnoreUnknown = "UseKeychain";
          AddKeysToAgent = "yes";
          UseKeychain = "yes";
        };
      };
    };
  };
}
