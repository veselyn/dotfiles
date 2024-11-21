_: {
  perSystem = {pkgs, ...}: {
    packages.smux = pkgs.writeShellApplication {
      name = "smux";
      runtimeInputs = builtins.attrValues {
        inherit
          (pkgs)
          argc
          fzf
          tmux
          ;
      };
      text = builtins.readFile ./smux.sh;
    };
  };
}
