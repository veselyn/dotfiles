_: {
  programs.texlive = {
    enable = true;

    extraPackages = texlive: {
      inherit (texlive) scheme-full;
    };
  };
}
