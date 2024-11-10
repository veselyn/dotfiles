_: {
  flake.lib.mkPkgs = nixpkgs: args:
    import nixpkgs ({
        config.allowUnfree = true;
      }
      // args);
}
