{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget htop nmap tmux rsync jq ripgrep bat borgbackup restic openssl strace
    telegram-desktop whatsapp-for-linux
    gnumake
    git
    libreoffice
    neovim ghostty
    neofetch
    bottles playonlinux virtualbox
    vscode
    lua php84 phpactor php84Packages.composer
    qbittorrent
    docker
    tlp
    obsidian
    spotify
    unzip
    krita gimp
    nixos-bgrt-plymouth
    flatpak

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
  ];
}
