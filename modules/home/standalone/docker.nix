_: {
  programs.zsh.initExtra = ''
    source <(docker completion zsh)
  '';
}
