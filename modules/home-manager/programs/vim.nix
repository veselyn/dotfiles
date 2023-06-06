{
  config,
  pkgs,
  ...
}: {
  programs.vim = {
    enable = true;

    defaultEditor = false;

    packageConfigurable = pkgs.vim-full.override {
      guiSupport = false;
      darwinSupport = true;
    };

    plugins = with pkgs.vimPlugins; [
      ReplaceWithRegister
      ale
      asyncomplete-buffer-vim
      asyncomplete-file-vim
      asyncomplete-lsp-vim
      asyncomplete-omni-vim
      asyncomplete-tags-vim
      asyncomplete-ultisnips-vim
      asyncomplete-vim
      auto-pairs
      camelcasemotion
      close-buffers-vim
      copilot-vim
      dash-vim
      editorconfig-vim
      emmet-vim
      fzf-vim
      indentLine
      ultisnips
      vim-abolish
      vim-addon-local-vimrc
      vim-capslock
      vim-commentary
      vim-dim
      vim-dispatch
      vim-easymotion
      vim-endwise
      vim-eunuch
      vim-fugitive
      vim-gitgutter
      vim-lsp
      vim-lsp-ale
      vim-lsp-settings
      vim-lsp-snippets
      vim-lsp-ultisnips
      vim-obsession
      vim-polyglot
      vim-repeat
      vim-rhubarb
      vim-rsi
      vim-scriptease
      vim-sleuth
      vim-sneak
      vim-snippets
      vim-surround
      vim-tmux-navigator
      vim-unimpaired
      vim-vinegar
      vimtex
      vimwiki
    ];

    extraConfig = ''
      source ${config.home.file.".vim".source}/vimrc
    '';
  };

  home.packages = with pkgs;
    lib.flatten (builtins.attrValues {
      linters = [
        buf
        cargo
        golangci-lint
        luaPackages.luacheck
        nodePackages.eslint
        python3Packages.flake8
        shellcheck
        sqlfluff
        statix
        vim-vint
      ];
      fixers = [
        alejandra
        buf
        gofumpt
        nodePackages.prettier
        python3Packages.autopep8
        python3Packages.isort
        rustfmt
        shfmt
        sqlfluff
        stylua
        terraform
      ];
    });

  home.file.".vim".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/vim";
}
