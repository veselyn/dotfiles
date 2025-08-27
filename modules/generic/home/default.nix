{
  perSystem,
  toplevel,
  ...
}: {
  home-manager = {
    extraSpecialArgs = {inherit toplevel perSystem;};
    useGlobalPkgs = true;
    useUserPackages = true;
  };
}
