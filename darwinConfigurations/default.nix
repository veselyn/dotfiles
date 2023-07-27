{darwin, ...} @ inputs: {
  veselins-macbook-pro = darwin.lib.darwinSystem {
    system = "aarch64-darwin";

    specialArgs = {inherit inputs;};

    modules = [
      ../modules/darwin
      {modules.darwin.user = "veselin";}
    ];
  };
}
