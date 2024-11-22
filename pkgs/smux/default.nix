_: {
  perSystem = {pkgs, ...}: {
    packages.smux = pkgs.writeShellApplication {
      name = "smux";
      runtimeInputs = builtins.attrValues {
        inherit
          (pkgs)
          argc
          fzf
          jq
          tmux
          ;
      };
      text = builtins.readFile ./smux.sh;
    };
  };
}
