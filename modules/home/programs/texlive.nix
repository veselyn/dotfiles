_: {
  programs.texlive = {
    enable = false;

    extraPackages = texlive: {
      inherit (texlive) scheme-full;
    };
  };
}
