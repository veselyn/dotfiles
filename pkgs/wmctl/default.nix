{self, ...}: {
  flake.packages = self.lib.mkPerDarwinSystem ({
    pkgs,
    system,
    ...
  }: {
    wmctl = self.lib.writeArgcApplication {
      inherit system;

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
