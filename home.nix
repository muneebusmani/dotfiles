{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "muneeb";
  home.homeDirectory = "/home/muneeb";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs ; [
    nerdfonts
    git
    microsoft-edge
    vim
    neovim
    nodejs-18_x
    gcc
    dotnet-sdk_8
    unzip
    curl
    wget
    dart
    btop
    nvtop
    htop
    docker
    docker-compose
    git
    gh
    github-desktop
    go
    fd
    php
    python3
    ripgrep
    ruby
    rustc
    cargo
    luarocks
    neovim
    lazygit
    zsh
    zsh-autocomplete
    zsh-autopair
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    xclip
    tmux
    discord
    obs-studio
    qbittorrent
    skypeforlinux
    telegram-desktop
    tigervnc
    vlc
    vscode-fhs
    whatsapp-for-linux
    zoom
    android-studio
    php83Packages.composer
    partition-manager
    neofetch
    kitty
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.sddm-kcm
    libsForQt5.kcmutils
    qt6Packages.qtstyleplugin-kvantum
    eza
    nix-init
    libsForQt5.bismuth
    figma-linux
    inkscape
  ];
  programs = {
    kitty = {
      enable = true;
      shellIntegration.mode = "enabled";
      shellIntegration.enableZshIntegration = true;
      shellIntegration.enableBashIntegration = true;
      shellIntegration.enableFishIntegration = true;
      font.name = "ComicShannsMono Nerd Font";
      font.package = pkgs.nerdfonts;
      font.size = 16;
      settings = {
        scrollback_lines = 10000;
        enable_audio_bell = false;
        confirm_os_window_close = 0;
        window_padding_width = 5;
        background_opacity = "0.80";
        background_blur = 1;
      };
      theme = "Catppuccin-Mocha";
    };
    starship = {
      enable = false;
      settings = {
        add_newline = true;
        character = {
          success_symbol = "[➜](bold green)";
          error_symbol = "[➜](bold red)";
        };
      };
    };
    tmux = {
      enable = true;
      plugins = with pkgs; [
        tmuxPlugins.catppuccin
        tmuxPlugins.yank
        tmuxPlugins.vim-tmux-navigator
        tmuxPlugins.resurrect
        tmuxPlugins.continuum
      ];
      keyMode = "vi";
      baseIndex = 1;
      shortcut = "space";
      mouse = true;
      newSession = true;
      escapeTime = 10;
      customPaneNavigationAndResize = true;
      terminal = "tmux-256color";
      extraConfig = ''
        set-option -sa terminal-features "xterm-kitty:RGB"
        set-option -g focus-events on
        set -g mouse on
        set-option -g history-limit 10000
        set -g renumber-windows on
        bind \` switch-client -t'{marked}'
        bind-key "|" split-window -h -c "#{pane_current_path}"
        bind-key "-" split-window -v -c "#{pane_current_path}"
        bind-key "\\" split-window -fh -c "#{pane_current_path}"
        bind-key "_" split-window -fv -c "#{pane_current_path}"
        bind -r "<" swap-window -d -t -1
        bind -r ">" swap-window -d -t +1
        bind -n M-n new-window -c "#{pane_current_path}"
        bind -n M-q killp
        bind Space last-window
        bind-key C-Space switch-client -l
        set -g @yank_selection primary # or 'secondary' or 'clipboard'
        set -g @continuum-restore 'on'
      '';
    };
    zsh = {
      package = pkgs.zsh;
      enable = true;
      autocd = true;
      shellAliases = {
        update-sys = "sudo nixos-rebuild switch";
        update-home = "home-manager switch";
        op = "nvim ~/.config/home-manager/home.nix";
        dg = "dotnet aspnet-codegenerator";
        cls = "clear";
        q = "exit";
        tarnow = "tar - acf ";
        untar = "tar - zxvf ";
        wget = "wget - c ";
        dir = "dir - -color=auto";
        vdir = "vdir - -color=auto";
        grep = "ugrep - -color=auto";
        fgrep = "ugrep - F - -color=auto";
        egrep = "ugrep - E - -color=auto";
        hw = "hwinfo - -short"; # Hardware Info
        ip = "ip - color";
        please = "sudo";
        jctl = "journalctl -p 3 -xb";
        ngc = "ng g c";
        open = "xdg-open";
        ngs = "ng serve";
        ndir = "cd ~/.config/nvim/";
        cdir = "cd ~/coding/";
        edge = "microsoft-edge-stable";
        ts = "tmux";
        tad = "tmux attach";
        sc-restart = "sudo systemctl restart";
        sc-stop = "sudo systemctl stop";
        sc-start = "sudo systemctl start";
        ".." = "cd ../";
        "..." = "cd .../";
        "...." = "cd ..../";
        "....." = "cd ...../";
        "......" = "cd ....../";
        ls = "exa -@lagbh --no-git --no-permissions --no-filesize --no-user  --changed";
        lazy = "NVIM_APPNAME=lazy nvim";
        packer = "NVIM_APPNAME=packer nvim";
      };
      enableAutosuggestions = true;
      sessionVariables = {
        DOTNET_ROOT = "$(dirname $(which dotnet))";
        PATH = "$PATH:/home/muneeb/.dotnet/tools";
        ZSH_TMUX_AUTOSTART = true;
        ZSH_TMUX_AUTOQUIT = false;
        VI_MODE_RESET_PROMPT_ON_MODE_CHANGE = true;
        VI_MODE_SET_CURSOR = true;
      };
      sessionVariables = {
        VISUAL = "nvim";
        EDITOR = "nvim";
        SUDO_EDITOR = "nvim";
      };
      syntaxHighlighting = {
        enable = true;
        package = pkgs.zsh-syntax-highlighting;
      };
      oh-my-zsh = {
        enable = true;
        package = pkgs.oh-my-zsh;
        theme = "robbyrussell";
        plugins = [
          "git"
          "node"
          "npm"
          "ng"
          "web-search"
          "aliases"
          "dotnet"
          "tmux"
          "vi-mode"
        ];
      };
    };
  };
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through "home.file".
  home.file = {
    # # Building this configuration will create a copy of "dotfiles/screenrc" in
    # # the Nix store. Activating the configuration will then make "~/.screenrc" a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ""
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # "";
  };

  # Home Manager can also manage your environment variables through
  # "home.sessionVariables". If you don"t want to manage your shell through Home
  # Manager then you have to manually source "hm-session-vars.sh" located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/muneeb/etc/profile.d/hm-session-vars.sh
  #
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
