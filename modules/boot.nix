{config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true;
      theme = "spinner";
    };
    kernelParams = [
      "i915.enable_psr=0"
      "i915.enable_guc=2"
    ];
    initrd.systemd.enable = false;
  };
}
