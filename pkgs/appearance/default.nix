{self, ...}: {
  flake.packages = self.lib.mkPerDarwinSystem ({pkgs, ...}: {
    appearance = pkgs.writeShellApplication {
      name = "appearance";
      runtimeInputs = builtins.attrValues {
        inherit
          (pkgs)
          argc
          kitty
          ;
      };
      text = builtins.readFile ./appearance.sh;
    };
  });
}
