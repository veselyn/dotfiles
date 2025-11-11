{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    home.shellAliases = {
      "gclean!" = "git clean --force -d";
      c = "pbcopy";
      da = "delta";
      das = "delta --side-by-side";
      f = "vifm";
      gai = "git add --interactive";
      j = "jobs";
      k = "kubectl";
      ldr = "lazydocker";
      lg = "lazygit";
      ls = "ls --color=auto";
      p = "pbpaste";
      s = "echo $SHLVL";
      v = "vim";
      vd = "vimdiff";
      vs = "vim -S Session.vim";
    };
  };
}
