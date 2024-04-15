{
  pkgs ? import <nixpkgs> {},
  pythonPackages ? pkgs.python311Packages,
}: let
  kernels = [
    pythonPackages.ipykernel
  ];

  # nix pkgs
  packages = [
    pkgs.poetry
  ];
in
  pkgs.mkShell rec {
    buildInputs = with pythonPackages;
      [
        jupyterlab
        numpy
        pandas
      ]
      ++ kernels
      ++ packages;

    shellHook = ''
      poetry add numpy pandas ipykernel
      exec zsh
    '';
  }
