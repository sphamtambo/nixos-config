{ pkgs, ... }:
{
  home.packages = with pkgs; [
    fd
    wget
    neofetch
    bat
    # stow
    lsd
    eza
    ripgrep
    lazygit
    unzip
    zip
    # docker
    # docker-compose
    nodejs
    # python313
    less
    tree
    htop
    # scrcpy
    # libreoffice
    # ntfs3g

    parallel
    mpi
    # python311Packages.numpy
    # python311Packages.pandas
    # python311Packages.scipy

    # bioinformatics tools
    avogadro2
    # pymol
    # jupyter
    openbabel
    # meme-suite
    # fastqc
    # bwa
    # samtools
    # seqtk
    # gatk
    # R

    audacity
    wf-recorder
    vlc
    google-chrome

    # cloudflare-warp
    # cloudflared
  ];
}
