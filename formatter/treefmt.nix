{
  projectRootFile = "flake.nix";

  programs = {
    alejandra.enable = true;
    shfmt.enable = true;
    stylua.enable = true;
  };
}
