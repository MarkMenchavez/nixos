{ ... }:

{
  imports =
    [ 
      ../../modules/system
      ../../modules/cli
      ../../modules/development

      # This is my personal virtual machine
      ../../users/mcdm.nix
    ];
  
  # Consider moving this to a separate module in the future
  services.openssh = {
    enable = true;
    openFirewall = true;
  };
}
