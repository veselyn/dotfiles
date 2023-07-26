{nixpkgs, ...} @ inputs: {
  veselins-macbook-pro = nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";

    specialArgs = {inherit inputs;};

    modules = [../modules/nixos];
  };
}
