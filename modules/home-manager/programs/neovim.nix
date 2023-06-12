{
  config,
  pkgs,
  ...
}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      ReplaceWithRegister
      camelcasemotion
      indent-blankline-nvim
      nvim-lspconfig
      nvim-treesitter.withAllGrammars
      telescope-nvim
      vim-dim
      vim-easymotion
      vim-sleuth
      vim-sneak
      vim-surround
      vim-tmux-navigator
    ];
  };

  home.packages = with pkgs; [
    lua-language-server
  ];

  xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
}
