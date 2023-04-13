{ self, flake-utils, ... }:

flake-utils.lib.eachDefaultSystemMap (system:
let packages = self.packages.${system}; in {
  battery = {
    type = "app";
    program = "${packages.battery}/bin/battery";
  };
  flushdns = {
    type = "app";
    program = "${packages.flushdns}/bin/flushdns";
  };
}
)
