{ config, pkgs, ... }:

{
  services = {
    printing.enable = true;
    libinput.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
    gnome.core-utilities.enable = true;

    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };
    longview.mysqlPasswordFile = "/run/keys/mysql.password";
#    phpfpm.pools.pool = {
#      user = "nginx";
#      settings = {
#       pm = "dynamic";
#	"listen.owner" = config.services.nginx.user;
#	"pm.max_children" = 5;
#	"pm.start_servers" = 5;
#	"pm.min_space_servers" = 1;
#	"pm.max_space_servers" = 3;
#	"pm.max_requests" = 500;
#      };
#    };
  };
}
