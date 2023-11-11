{pkgs, ...}: {
  programs.nnn = {
    enable = true;
  };

  programs.zsh.initExtra = ''
    source ${pkgs.nnn}/share/quitcd/quitcd.bash_sh_zsh
  '';
}
