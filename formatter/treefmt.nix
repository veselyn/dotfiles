{
  projectRootFile = "flake.nix";

  programs = {
    alejandra.enable = true;

    shfmt = {
      enable = true;
      indent_size = null;
    };

    stylua.enable = true;
  };
}
