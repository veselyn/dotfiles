_: {
  perSystem = {pkgs, ...}: {
    packages.smux = pkgs.writeShellApplication {
      name = "smux";
      text = builtins.readFile ./smux.sh;
    };
  };
}
