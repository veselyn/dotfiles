{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;

  gcoreutils = let
    inherit
      (pkgs)
      coreutils-full
      findutils
      gnugrep
      gnumake
      gnused
      gnutar
      inetutils
      runCommand
      time
      ;
  in
    runCommand "gcoreutils" {} ''
      mkdir -p "$out/bin"

      function prefix() {
        local drv=$1

        for bin in "$drv"/bin/*; do
          ln -s "$bin" "$out/bin/g$(basename "$bin")"
        done
      }

      prefix "${coreutils-full}"
      prefix "${findutils}"
      prefix "${findutils.locate}"
      prefix "${gnugrep}"
      prefix "${gnumake}"
      prefix "${gnused}"
      prefix "${gnutar}"
      prefix "${inetutils}"
      prefix "${time}"
    '';
in {
  config = lib.mkIf cfg.enable {
    home.packages = [gcoreutils];
  };
}
