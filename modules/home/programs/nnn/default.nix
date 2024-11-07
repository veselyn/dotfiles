{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.nnn = {
      enable = true;

      package = pkgs.nnn.overrideAttrs (previousAttrs: {
        patches = previousAttrs.patches ++ [./quitcd.patch];
      });
    };

    programs.zsh.initExtra = ''
      source ${config.programs.nnn.package}/share/quitcd/quitcd.bash_sh_zsh
    '';
  };
}
