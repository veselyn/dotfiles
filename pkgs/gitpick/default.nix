_: {
  perSystem = {pkgs, ...}: {
    packages.gitpick = pkgs.writeShellApplication {
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
