_: {
  programs.zsh.initExtra = ''
    if command -v docker >/dev/null; then
      source <(docker completion zsh)
    fi
  '';
}
