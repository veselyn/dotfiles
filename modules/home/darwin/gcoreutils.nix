{pkgs, ...}: let
  gcoreutils = with pkgs;
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
  home.packages = [gcoreutils];
}
