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
      close-buffers-vim
      dash-vim
      indent-blankline-nvim
      nvim-autopairs
      nvim-lspconfig
      nvim-treesitter-context
      nvim-treesitter-endwise
      nvim-treesitter.withAllGrammars
      nvim-ts-autotag
      telescope-nvim
      vim-abolish
      vim-capslock
      vim-commentary
      vim-dim
      vim-dispatch
      vim-easymotion
      vim-eunuch
      vim-fugitive
      vim-gitgutter
      vim-obsession
      vim-repeat
      vim-rhubarb
      vim-rsi
      vim-scriptease
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
