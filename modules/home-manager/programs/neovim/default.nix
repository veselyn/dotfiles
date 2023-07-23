{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      bufjump-nvim
      ReplaceWithRegister
      camelcasemotion
      close-buffers-vim
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      copilot-vim
      dash-vim
      friendly-snippets
      indent-blankline-nvim
      luasnip
      neodev-nvim
      null-ls-nvim
      nvim-autopairs
      nvim-cmp
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

  home.packages = with pkgs;
    lib.flatten (builtins.attrValues {
      servers = [
        gopls
        lua-language-server
        nil
        nodePackages.bash-language-server
        rust-analyzer
      ];
      diagnostics = [
        statix
      ];
      formatting = [
        alejandra
        stylua
      ];
    });

  xdg.configFile.nvim.source = ./nvim;
}