{ pkgs, ... }:
{
  # Enable Bluetooth
  services.blueman.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        ControllerMode = "dual"; # Allows both BLE and Classic
        FastConnectable = true;
      };
    };
  };
}
