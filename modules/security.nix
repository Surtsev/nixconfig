{config, pkgs, ... }:

{
   security = {
       sudo.extraConfig = "Surtsev ALL = NOPASSWD: /etc/hypr/scripts/power.sh";
       polkit.enable = true;
       sudo.enable = true;
   };
}
