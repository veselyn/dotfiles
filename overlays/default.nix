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
        rev = "5c22c5812ec8b980d223b8252edc7759dd354014";
        sha256 = "sha256-kbMbB9LUc32kob91cGn7vrHyF1e3RtQMxRxh/Y55a/w=";
      };
    });

    yabai = prev.yabai.overrideAttrs rec {
      version = "6.0.1";
      src = final.fetchzip {
        url = "https://github.com/koekeishiya/yabai/releases/download/v${version}/yabai-v${version}.tar.gz";
        hash = "sha256-CXkGVoJcGSkooxe7eIhwaM6FkOI45NVw5jdLJAzgFBM=";
      };
    };
  };
}
