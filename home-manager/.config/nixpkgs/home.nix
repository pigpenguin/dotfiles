{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.broot
    pkgs.direnv
    pkgs.fossil
    pkgs.lorri
    pkgs.niv
    #pkgs.pijul
    pkgs.powerline-go
  ];
  
  programs.bat = {
    enable = true;
    config = {
      theme = "OneHalfDark";
    };
  };

  programs.neovim = {
    enable   = true; # Install neovim
    viAlias  = true; # Alias vi to nvim
    vimAlias = true; # Alias vim to nvim

    extraConfig = builtins.readFile ./init.vim;

    plugins = with pkgs.vimPlugins; [
      seoul256-vim  # Color Scheme
      lightline-vim # Status Bar
      vim-startify  # Startpage/status managment
      vim-which-key # Keybind manager
      goyo-vim      # Zen
      vim-nix       # Nix language support
      vimwiki       # Personal wiki
    ];
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "20.03";
}
