{ config, pkgs, ... }:

{
  networking.hostName = "nixos";
  systemd.network.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;
  networking.networkmanager.enable = true;
     networking.firewall = {
     enable = true;
     allowedTCPPorts = [ 80 443 1080 8080 8081];
   };
  networking.extraHosts = ''
    127.0.0.3 phpmyadmin
  '';

}
