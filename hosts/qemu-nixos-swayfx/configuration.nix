{ ... }:

{
  imports =
    [
      # Base configuration
      ../common

      # Machine-specific
      ./hardware-configuration.nix

      # Virtualization
      ../../modules/virtualization/qemu.nix

      # Desktop
      ../../modules/desktop/greetd.nix
      ../../modules/desktop/swayfx.nix
    ];

  networking.hostName = "qemu-nixos-swayfx";
 
  system.stateVersion = "26.05";
}
