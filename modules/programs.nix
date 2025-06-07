{ config, pkgs, ... }:

{
  programs = {
    tmux.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      ohMyZsh = {
        enable = true;
	plugins = ["git"];
	theme = "jispwoso";
      };
      shellAliases = {
        ll = "ls -la";
	edit = "sudo -e";
	configure = "sudo nvim /etc/nixos/";
	update = "sudo nixos-rebuild switch";
	vim = "nvim";
	off = "poweroff";
      };
    };
    firefox.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    dconf.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

  };
}
