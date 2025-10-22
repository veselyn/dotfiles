{self, ...}: {
  perSystem = {
    pkgs,
    system,
    ...
  }: {
    packages.smux = self.lib.writeArgcApplication {
      inherit system;

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
