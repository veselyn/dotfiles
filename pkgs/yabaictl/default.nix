_: {
  perSystem = {pkgs, ...}: {
    packages.yabaictl = pkgs.writeShellApplication {
      name = "yabaictl";
      runtimeInputs = builtins.attrValues {
        inherit
          (pkgs)
          argc
          yabai
          ;
      };
      text = builtins.readFile ./yabaictl.sh;
    };
  };
}
