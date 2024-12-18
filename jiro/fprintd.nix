{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
     usbutils
     fprintd
  ];

  # to check device, execute `lsusb | grep -i finger`
  # to enroll, execute `fprintd-enroll`
  services.fprintd.enable = true;
}
