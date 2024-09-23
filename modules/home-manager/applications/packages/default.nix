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
    # python313
    less
    tree
    htop
    scrcpy
    libreoffice
    ntfs3g

    pymol
    jupyter
    openbabel
    parallel
    mpi
    python311Packages.numpy
    python311Packages.pandas
    meme-suite

    # cloudflare-warp
    # cloudflared
  ];
}
