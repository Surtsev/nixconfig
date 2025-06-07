# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/boot.nix
      ./modules/locale.nix
      ./modules/desktop.nix
      ./modules/services.nix
      ./modules/programs.nix
      ./modules/users.nix
      ./modules/network.nix
      ./modules/nginx.nix
      ./modules/packages.nix
      ./modules/security.nix
      ./modules/virt.nix
    ];
  nixpkgs.config.allowUnfree = true;  # Разрешить несвободные пакеты
  nixpkgs.config.allowBroken = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  system = {
    copySystemConfiguration = true;
    autoUpgrade = {
      enable = true;
      dates = "*-*-* 04:00:00";
      persistent = true;
      allowReboot = true;
      channel = "https://channels.nixos.org/nixos-25.05";
    };

    stateVersion = "24.11";
  };
  nix.gc = {
    automatic = true;
    persistent = false;
    dates = "daily";
    options = "--delete-older-than 15d";
  };
}

