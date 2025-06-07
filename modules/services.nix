{ config, pkgs, ... }:

{
  services = {
    printing.enable = true;
    libinput.enable = true;
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

       #Optional helps save long term battery health
       START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
       STOP_CHARGE_THRESH_BAT0 = 90; # 80 and above it stops charging

      };
    };

    logind = {
      powerKey = "suspend";
      powerKeyLongPress = "poweroff";
      extraConfig = ''
        HandlePowerKey=poweroff
      '';
    };

    pipewire = {
      enable = true;
      pulse.enable = true;
    };
    openssh.enable = true;
    gnome.core-utilities.enable = true;

    mysql = {
      enable = true;
      package = pkgs.mariadb;
      initialScript = pkgs.writeText "mysql-init.sql" ''
        GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' IDENTIFIED BY '--=' WITH GRANT OPTION;
        FLUSH PRIVILEGES;
        '';
      };
    longview.mysqlPasswordFile = "/run/keys/mysql.password";
    phpfpm.pools.pool = {
      user = "nginx";
      group = "nginx";
      settings = {
       "listen" = "/run/phpfpm/pool.sock";
       "listen.owner" = "nginx";
       "listen.group" = "nginx";
       "pm" = "dynamic";
       "pm.max_children" = 5;
       "pm.start_servers" = 2;
       "pm.min_spare_servers" = 1;
       "pm.max_spare_servers" = 3;
       "pm.max_requests" = 500;
      };
    };
  };

}
