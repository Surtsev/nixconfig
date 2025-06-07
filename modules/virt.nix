{config, pkgs, ...}:

{
  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  users.extraGroups.vboxusers.members = [ "Surtsev" ];
  services.udev.extraRules = ''
    KERNEL=="vboxdrv", GROUP="vboxusers", MODE="0660"
    KERNEL=="vboxnetctl", GROUP="vboxusers", MODE="0660"
  '';
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.clipboard = true;
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["Surtsev"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
