_: {
  perSystem = {pkgs, ...}: {
    packages.opsh = pkgs.writeShellApplication {
      name = "opsh";
      runtimeInputs = builtins.attrValues {
        inherit
          (pkgs)
          _1password-cli
          argc
          ;
      };
      text = builtins.readFile ./opsh.sh;
    };
  };
}
