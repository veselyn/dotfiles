{
  inputs,
  self,
  ...
}: {
  flake.overlays = {
    default = final: _prev: {
      unstable = self.lib.mkPkgs inputs.nixpkgs {inherit (final) system;};
      stable = self.lib.mkPkgs inputs.nixpkgs-stable {inherit (final) system;};
      master = self.lib.mkPkgs inputs.nixpkgs-master {inherit (final) system;};
    };

    yabai = final: prev: {
      yabai = prev.yabai.overrideAttrs (_: {
        src = final.fetchFromGitHub {
          owner = "YazeedAlKhalaf";
          repo = "yabai";
          rev = "9d6104a01fcba61ab4a19e5c19931da9efc76a7a";
          hash = "sha256-eo+bU3k93rXnDDmefscC8AjxDvv08hs9B6bfqqPgdQ0=";
        };
      });
    };
  };
}
