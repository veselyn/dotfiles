{self, ...}: overrides:
{
  overlays = builtins.attrValues self.overlays;
  config.allowUnfree = true;
}
// overrides
