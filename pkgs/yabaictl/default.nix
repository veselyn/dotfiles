{self, ...}: {
  flake.packages = self.lib.mkPerDarwinSystem ({pkgs, ...}: {
    yabaictl = pkgs.writeShellApplication {
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
  });
}
