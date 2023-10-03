{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      ReplaceWithRegister
      SchemaStore-nvim
      bufjump-nvim
      camelcasemotion
      close-buffers-vim
      cmp-buffer
      cmp-nvim-lsp
      cmp-path
      cmp_luasnip
      copilot-vim
      dash-vim
      diffview-nvim
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
      vimtex
    ];
  };

  home.packages = with pkgs;
    lib.flatten (builtins.attrValues {
      servers = [
        gopls
        jdt-language-server
        lua-language-server
        nil
        nodePackages.bash-language-server
        nodePackages.pyright
        nodePackages.typescript-language-server
        nodePackages.yaml-language-server
        omnisharp-roslyn
        rust-analyzer
        texlab
        vscode-langservers-extracted
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
