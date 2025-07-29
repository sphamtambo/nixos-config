{ config, pkgs, ... }:
{
  # Other hardware options
  hardware.pulseaudio.enable = false; # Disable PulseAudio if using PipeWire
  security.rtkit.enable = true; # Real-time priority for audio

  # Enable PipeWire (alternative to PulseAudio)
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    pulse.enable = true; # PulseAudio compatibility layer
    wireplumber.enable = true; # PipeWire session manager
  };

  # Optional: Extra modprobe option for some microphones
  boot.extraModprobeConfig = "options snd-hda-intel dmic_detect=0";
}
