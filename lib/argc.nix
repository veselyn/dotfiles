{inputs, ...}: {
  flake.lib = {
    writeArgcApplication = args @ {
      system,
      name,
      ...
    }: let
      pkgs = import inputs.nixpkgs {inherit system;};
      argsFinal = builtins.removeAttrs args ["system"];
      app = pkgs.writeShellApplication argsFinal;
    in
      app.overrideAttrs (previousAttrs: {
        nativeBuildInputs = builtins.attrValues {
          inherit (pkgs) argc installShellFiles;
        };

        buildCommand =
          previousAttrs.buildCommand
          + ''
            argc --argc-build "$target" "${name}"

            argc --argc-mangen "$target" .

            argc --argc-completions bash "$target" >"${name}.bash"
            argc --argc-completions fish "$target" >"${name}.fish"
            argc --argc-completions nushell "$target" >"${name}.nu"
            argc --argc-completions zsh "$target" >"${name}.zsh"
          ''
          + ''
            installBin "${name}"

            installManPage "${name}.1" "${name}"-*.1

            installShellCompletion "${name}.bash"
            installShellCompletion "${name}.fish"
            installShellCompletion "${name}.nu"
            installShellCompletion "${name}.zsh"
          '';
      });
  };
}
