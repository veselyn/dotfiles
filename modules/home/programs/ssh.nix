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

      matchBlocks =
        lib.genAttrs ["pve01" "pve02" "pve03" "pve04" "pve05"] (node: {
          hostname = "${node}.homelab.veselabs.com";
          user = "root";
        })
        // lib.genAttrs ["master01" "master02" "master03" "worker01" "worker02"] (node: {
          hostname = "${node}.kubernetes.homelab.veselabs.com";
          user = "debian";
        });
    };
  };
}
