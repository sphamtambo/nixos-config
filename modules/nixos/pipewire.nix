{...}: {
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  # hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;
  # show battery of blueman devices
  hardware.bluetooth.settings = {
    General = {
      Experimental = true;
    };
  };
  # auto switch audio to the connected device
  hardware.pulseaudio.extraConfig = "
  load-module module-switch-on-connect
";
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # lowLatency.enable = true;
  };
}
