{config, pkgs, ... }:

{
  time.timeZone = "Europe/Moscow";
  i18n.defaultLocale = "en_US.UTF-8";
  console.useXkbConfig = true;
  services.xserver = {
    xkb = {
      layout = "us,ru";
      options = "grp:win_space_toggle";
    };
  };  
}
