{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.zsh.initExtra = ''
      if command -v docker >/dev/null; then
        source <(docker completion zsh)
      fi
    '';
  };
}
