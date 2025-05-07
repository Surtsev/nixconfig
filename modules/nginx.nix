{ config, pkgs, ... }:

{
  services.nginx = {
    enable = true;
    
    virtualHosts = {
      "localhost" = {
        root = "/var/www/local";
	locations."/".extraConfig = ''
	  location ~* \.php(/|$) {
	    fastcgi_split_path_info ^(.+/.php)(/.*)$;
	    fastcgi_pass unix:${config.services.phpfpm.pools.pool.socket};
            fastcgi_param SCRIPT_FILENAME	$document_root$fastcgi_script_name;
	    fastcgi_param PATH_INFO		$fastcgi_path_info;
	    include ${config.services.nginx.package}/conf/fastcgi_params;
	    include ${pkgs.nginx}/conf/fastcgi.conf;
          }
	'';
      };
    };
  };
}
