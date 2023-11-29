{
  nixpkgs-stable,
  nixpkgs-master,
  ...
}: {
  default = final: prev: let
    stable = import nixpkgs-stable {inherit (prev) system;};
    master = import nixpkgs-master {inherit (prev) system;};
    pkgs = prev.callPackages ../pkgs {};
  in {
    inherit stable;
    inherit master;

    inherit
      (pkgs)
      battery
      flushdns
      yabaictl
      ;

    oh-my-zsh = prev.oh-my-zsh.overrideAttrs (previousAttrs: {
      src = previousAttrs.src.override {
        rev = "418046e9583f635b0303e4b8cf31c356b175cec3";
        sha256 = "sha256-r36vF37J+3rLGg0QzmT4U8Lp5nqRhAs8We0aDtBJKJM=";
      };
    });
  };
}
