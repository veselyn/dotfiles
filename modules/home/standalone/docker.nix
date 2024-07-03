_: {
  programs.zsh.initExtra = ''
    if command -v docker; then
      source <(docker completion zsh)
    fi
  '';
}
