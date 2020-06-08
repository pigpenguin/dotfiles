{ config, pkgs, lib, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg.enable = true;

  home.sessionVariables = {
    EDITOR               = "nvim";
    GOPATH               = "${config.xdg.configHome}/go";
    LESSKEY              = "${config.xdg.configHome}/less/lesskey";
    LESSHISTFILE         = "${config.xdg.cacheHome}/less/history";
    MATHEMATICA_USERBASE = "${config.xdg.configHome}/mathematica";
    TEXMFHOME            = "${config.xdg.configHome}/texmf";
    # Mathematica has .Wolfram and "Wolfram Mathematica" dunno how to move those
  };

  home.packages = [
    pkgs.direnv
    pkgs.fossil
    pkgs.lorri
    #pkgs.nitrogen I can't work out how to make this persist at the moment
    pkgs.niv
    #pkgs.pijul
    pkgs.ripgrep
    pkgs.sxiv
    pkgs.youtube-dl
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
      # Seoul256 Terminal colors
      background           = "#3a3a3a";
      foreground           = "#d0d0d0";
      color0               = "#4e4e4e";
      color1               = "#d68787";
      color2               = "#5f865f";
      color3               = "#d8af5f";
      color4               = "#85add4";
      color5               = "#d7afaf";
      color6               = "#87afaf";
      color7               = "#d0d0d0";
      color8               = "#626262";
      color9               = "#d75f87";
      color10              = "#87af87";
      color11              = "#ffd787";
      color12              = "#add4fb";
      color13              = "#ffafaf";
      color14              = "#87d7d7";
      color15              = "#e4e4e4";
      cursor               = "#d0d0d0";
      selection_foreground = "#D1D1D1";
      selection_background = "#005E5E";
      adjust_line_height   = "126%";
      font_size            = "13.0";
      #background_opacity   = "0.9"; looks bad with these colors
      allow_remote_control = true;
      enable_audio_bell    = false;
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
