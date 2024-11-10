{
  config,
  lib,
  ...
}: let
  cfg = config.self.modules.home;
in {
  imports = [
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
      fzf.enable = true;
      gh.enable = true;
      gpg.enable = true;
      htop.enable = true;
      jq.enable = true;
      k9s.enable = true;
      lazygit.enable = true;
      ssh.enable = true;
      tealdeer.enable = true;
      zoxide.enable = true;
    };
  };
}
