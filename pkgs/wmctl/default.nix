{self, ...}: {
  flake.packages = self.lib.mkPerDarwinSystem ({pkgs, ...}: {
    wmctl = pkgs.writeShellApplication {
      name = "wmctl";
      runtimeInputs = builtins.attrValues {
        inherit
          (pkgs)
          argc
          ;
      };
      text = builtins.readFile ./wmctl.sh;
    };
  });
}
