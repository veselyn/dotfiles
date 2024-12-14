_: {
  perSystem = {pkgs, ...}: {
    packages.smux = pkgs.writeShellApplication {
      name = "smux";
      runtimeInputs = builtins.attrValues {
        inherit
          (pkgs)
          argc
          coreutils
          fd
          fzf
          jq
          tmux
          ;
        inherit (pkgs.unixtools) column;
      };
      text = builtins.readFile ./smux.sh;
    };
  };
}
