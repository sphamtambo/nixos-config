{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    xclip
    wl-clipboard
    cliphist

    # tenacity

    # bluez
    # bluez-alsa
    blueman
    # bluez-tools

    direnv
    networkmanagerapplet
    networkmanager
    swaynotificationcenter
    # mako
    # swayidle
    # swaybg
    # swaylock
    # wofi
    wlroots
    # xfce.xfce4-appfinder
    slurp
    grim
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast
    imv # image viewer
    nwg-look
    xfce.thunar
    nemo
    brightnessctl
    light
    fuzzel
    qt5.qtwayland
    qt6.qtwayland
    xwayland

    # lxde.lxsession
    # cinnamon.mint-themes
    file # Show file information
    gtrash # rm replacement, put deleted files in system trash
    nitch # systhem fetch util
    nix-prefetch-github
    nix-prefetch-git

    todo # cli todo list
    toipe # typing test in the terminal
    # valgrind # c memory analyzer
    # gnome.zenity
    # yad
    bleachbit # cache cleaner
    cmatrix
    gparted # partition manager
    man-pages # extra man pages
    ncdu # disk space
    openssl
    qalculate-gtk # calculator
    xdg-utils
    killall
    gnome-disk-utility

    ffmpeg
    mpv # video player
    soundwireserver # pass audio to android phone
    pamixer # pulseaudio command line mixer
    pavucontrol # pulseaudio volume controle (GUI)
    # pipewire
    wireplumber
    playerctl # controller for media players
    alsa-utils # provides amixer/alsamixer/...
    # pulseaudio
    sox
    mpd # for playing system sounds
    mpc_cli # command-line mpd client
    ncmpcpp # a mpd client with a UI

    # steam
    # steam
    # steam-run
  ];

}
