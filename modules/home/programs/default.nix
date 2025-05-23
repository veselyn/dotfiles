{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  imports = [
    ./atuin.nix
    ./fzf.nix
    ./git.nix
    ./kitty.nix
    ./neovim
    ./nnn
    ./tmux.nix
    ./zsh.nix
  ];

  config = lib.mkIf cfg.enable {
    programs = {
      bat.enable = true;
      btop.enable = true;
      command-not-found.enable = true;
      direnv.enable = true;
      direnv.nix-direnv.enable = true;
      fd.enable = true;
      gh.enable = true;
      gpg.enable = true;
      htop.enable = true;
      jq.enable = true;
      k9s.enable = true;
      lazydocker.enable = true;
      lazygit.enable = true;
      man.generateCaches = true;
      ripgrep.enable = true;
      ssh.enable = true;
      tealdeer.enable = true;
      zoxide.enable = true;
    };
  };
}
