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
      vim-abolish
      vim-capslock
      vim-commentary
      vim-dim
      vim-dispatch
      vim-easymotion
      vim-endwise
      vim-eunuch
      vim-fugitive
      vim-obsession
      vim-repeat
      vim-rhubarb
      vim-rsi
      vim-sleuth
      vim-sneak
      vim-surround
      vim-tmux-navigator
      vim-unimpaired
      vim-vinegar
    ];
  };

  home.packages = with pkgs; [
    lua-language-server
  ];

  xdg.configFile.nvim.source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
}
