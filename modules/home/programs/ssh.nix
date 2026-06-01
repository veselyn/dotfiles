{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.ssh = {
      enable = true;
      enableDefaultConfig = false;

      settings =
        lib.genAttrs' ["pve01" "pve02" "pve03"] (node:
          lib.nameValuePair "Host ${node}" {
            hostname = "${node}.homelab.veselabs.com";
            user = "root";
          })
        // lib.genAttrs' ["master01" "master02" "master03"] (node:
          lib.nameValuePair "Host ${node}" {
            hostname = "${node}.kubernetes.homelab.veselabs.com";
            user = "debian";
          });
    };
  };
}
