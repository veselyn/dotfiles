{toplevel, ...}: {
  home-manager = {
    extraSpecialArgs = {inherit toplevel;};

    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
