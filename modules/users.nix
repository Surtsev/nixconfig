{ config, pkgs, ... }:

{
  users = {
    users.Surtsev = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "networkmanager" "vboxusers" "plugdev" "video" "audio" ];
      packages = with pkgs; [
        tree
      ];
    };
  };  
}
