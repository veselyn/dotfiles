{
  config,
  pkgs,
  ...
}: let
  cfg = config.programs.nnn;
in {
  programs.nnn = {
    enable = true;

    package = pkgs.nnn.overrideAttrs (previousAttrs: {
      patches = previousAttrs.patches ++ [./quitcd.patch];
    });
  };

  programs.zsh.initExtra = ''
    source ${cfg.package}/share/quitcd/quitcd.bash_sh_zsh
  '';
}
