_: {
  perSystem = {pkgs, ...}: {
    packages.gitpick = pkgs.writeShellApplication {
      name = "gitpick";
      text = builtins.readFile ./gitpick.sh;
    };
  };
}
