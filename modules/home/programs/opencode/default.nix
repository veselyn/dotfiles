{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.opencode = {
      enable = true;
      settings = {
        theme = "system";
      };
    };

    xdg.configFile = let
      symlink = true;
    in
      if symlink
      then {
        "opencode/AGENTS.md".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/programs/opencode/AGENTS.md";
        "opencode/agents".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/programs/opencode/agents";
        "opencode/commands".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/programs/opencode/commands";
        "opencode/skills".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/programs/opencode/skills";
        "opencode/tools".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/home/programs/opencode/tools";
      }
      else {
        "opencode/AGENTS.md".source = ./AGENTS.md;
        "opencode/agents".source = ./agents;
        "opencode/commands".source = ./commands;
        "opencode/skills".source = ./skills;
        "opencode/tools".source = ./tools;
      };
  };
}
