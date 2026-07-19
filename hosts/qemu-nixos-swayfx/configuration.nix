{ ... }:

{
  imports =
    [ 
      ../common/configuration.nix

      ./hardware-configuration.nix

      ../../modules/virtualization/qemu.nix

      ../../modules/desktop/greetd.nix
      ../../modules/desktop/swayfx.nix
    ];

  networking.hostName = "qemu-nixos-swayfx";
 
  system.stateVersion = "26.05";
}
