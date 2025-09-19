{ config, pkgs, ... }:

{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Select the display manager (login screen)
  services.xserver.displayManager.sddm.enable = true;

  # Select KDE Plasma
  services.xserver.desktopManager.plasma5.enable = true;

  # (Optional, newer setups prefer PipeWire)
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
