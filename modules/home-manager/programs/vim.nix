{
  config,
  pkgs,
  ...
}: {
  programs.vim = {
    enable = true;

    defaultEditor = true;

    packageConfigurable = pkgs.vim_configurable.override {
      guiSupport = false;
      darwinSupport = true;
    };

    extraConfig = ''
      source ${config.home.file.".vim".source}/vimrc
    '';
  };
}
