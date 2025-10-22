{self, ...}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: {
    packages.gitpick = self.lib.writeArgcApplication {
      inherit system;

      name = "gitpick";
      runtimeInputs = builtins.attrValues {
        inherit
          (pkgs)
          argc
          git
          ;
      };
      text = builtins.readFile ./gitpick.sh;
    };
  };
}
