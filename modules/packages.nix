{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    (import ./mypkgs/custom-wlogout.nix {})
    wget htop nmap wl-clipboard clipse tmux rsync jq ripgrep bat borgbackup restic openssl strace tldr brightnessctl ncdu
    telegram-desktop whatsapp-for-linux
    nautilus
    tabiew
    dunst grim slurp
    gnumake
    mpv kodi vlc
    gtk4 gtk3 gtk2   
    librsvg
    git
    cowsay raylib-games snake4
    libreoffice	adobe-reader
    neovim ghostty	yazi
    neofetch
    bottles playonlinux virtualbox	wine
    vscode
    nil sqls gcc clang lua php84 phpactor php84Packages.composer
    qbittorrent
    docker
    v2ray 
    obsidian
    spotify
    unzip
    krita gimp obs-studio
    nixos-bgrt-plymouth
    flatpak	cargo-gra	libportal	flatpak-builder
    rofi waybar rofi-network-manager rofi-menugen rofi-bluetooth eww hellwal 
    pavucontrol
    cava
    networkmanagerapplet
    blueman
    ggh sshuttle hiddify-app
    hmcl
    rPackages.RobLox

    hyprpaper
    hyprlock
    hyprshot
    hyprlang
    jq          # Для парсинга JSON (язык клавиатуры)
    wlogout     # Меню выключения

    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.caffeine
    gnomeExtensions.clipboard-indicator
    gnomeExtensions.emoji-copy
    gnomeExtensions.just-perfection
    gnomeExtensions.user-themes
    gnomeExtensions.tray-icons-reloaded
    gnomeExtensions.panel-corners
    gnomeExtensions.zen
    gnomeExtensions.wireguard-vpn-extension
    gnomeExtensions.volume-boost
    gnomeExtensions.translate-clipboard
    gnomeExtensions.todo-list
    gnomeExtensions.burn-my-windows
    gnomeExtensions.open-bar
  ];
  fonts.packages = with pkgs; [
    fira-code
    font-awesome
    jetbrains-mono
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "adobe-reader-9.5.5"
  ];
}
