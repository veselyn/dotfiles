{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.self.modules.home;
in {
  config = lib.mkIf cfg.enable {
    programs.neovim = {
      enable = true;

      defaultEditor = true;

      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = builtins.attrValues {
        inherit
          (pkgs.vimPlugins)
          ReplaceWithRegister
          SchemaStore-nvim
          bufjump-nvim
          camelcasemotion
          close-buffers-vim
          cmp-buffer
          cmp-nvim-lsp
          cmp-path
          cmp_luasnip
          conflict-marker-vim
          copilot-vim
          dash-vim
          diffview-nvim
          friendly-snippets
          indent-blankline-nvim
          lazydev-nvim
          luasnip
          neoconf-nvim
          none-ls-nvim
          nvim-autopairs
          nvim-cmp
          nvim-lspconfig
          nvim-treesitter-context
          nvim-treesitter-endwise
          nvim-ts-autotag
          rainbow-delimiters-nvim
          telescope-fzf-native-nvim
          telescope-nvim
          tinykeymap
          trim-nvim
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
          zen-mode-nvim
          ;
        inherit (pkgs.vimPlugins.nvim-treesitter) withAllGrammars;
      };

      extraPackages = builtins.attrValues {
        inherit
          (pkgs)
          emmet-language-server
          gopls
          jdt-language-server
          lua-language-server
          nil
          omnisharp-roslyn
          pyright
          rust-analyzer
          tailwindcss-language-server
          texlab
          treefmt
          vscode-langservers-extracted
          ;
        inherit
          (pkgs.nodePackages)
          bash-language-server
          typescript-language-server
          yaml-language-server
          ;
      };
    };

    xdg.configFile.nvim.source = ./nvim;
  };
}
