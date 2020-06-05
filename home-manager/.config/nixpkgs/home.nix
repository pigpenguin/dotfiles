{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg.enable = true;

  home.sessionVariables = {
    EDITOR               = "nvim";
    TEXMFHOME            = "${config.xdg.configHome}/texmf";
    LESSKEY              = "${config.xdg.configHome}/less/lesskey";
    LESSHISTFILE         = "${config.xdg.cacheHome}/less/history";
    MATHEMATICA_USERBASE = "${config.xdg.configHome}/mathematica";
    # Mathematic has .Wolfram and "Wolfram Mathematica" dunno how to move those
  };

  home.packages = [
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

  programs.bash = {
    enable = false; # Not 100% about this yet

    shellAliases = {
      mkdir = "mkdir -p";           # Create parent directories as needed
      ls    = "ls --color";         # List with colors
      cp    = "cp -i";              # Confirm before doing stupid stuff
      mv    = "mv -i";              # Confirm before doing stupid stuff
      rm    = "rm -i";              # Confirm before doing stupid stuff
      diff  = "colordiff -b -B";    # Colordiff makes it colored
                                    # -b ignore white space
                                    # -B ignore blank lines
      icat  = "kitty +kitten icat"; # View an image
    };
    
  };

  programs.broot = {
    enable = true;
  };

  programs.kitty = {
    enable = true;
    settings = {
      allow_remote_control = true;
      enable_audio_bell = false;
    };
    extraConfig = "background_opacity 0.8";
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
