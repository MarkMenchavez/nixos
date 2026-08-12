{
  imports =
    [
      # Base configuration
      ../common

      # Machine-specific (Keeping the old hardware config for now, as requested)
      ./hardware-configuration.nix 

      # Virtualization - SWITCHED FROM QEMU TO VMWARE ABSTRACTION
      ../../modules/virtualization/vmware.nix 

      # Desktop
      ../../modules/desktop/greetd.nix
      ../../modules/desktop/swayfx.nix
    ];

  networking.hostName = "vmware-nixos-swayfx";
 
  system.stateVersion = "26.05";
}
