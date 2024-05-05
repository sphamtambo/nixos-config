{pkgs, ...}: {
  home.packages = with pkgs; [
    fd
    wget
    neofetch
    bat
    stow
    lsd
    eza
    ripgrep
    lazygit
    unzip
    zip
    docker
    docker-compose
    nodejs
    python313
    zathura
    less
    tree
    htop
    scrcpy
    libreoffice

    # cloudflare-warp
    # cloudflared
  ];
}
