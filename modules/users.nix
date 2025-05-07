{ config, pkgs, ... }:

{
  users = {
    users.Surtsev = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "networkmanager" "video" "audio" ];
      packages = with pkgs; [
        tree
      ];
    };
  };  
}
