{
  pkgs ? import <nixpkgs> {},
  pythonPackages ? pkgs.python311Packages,
}:
pkgs.mkShell {
  buildInputs = [
    pkgs.python311
    pkgs.black
    pkgs.isort
    pkgs.poetry

    pythonPackages.requests
    pythonPackages.pandas
  ];
  shellHook = ''
    poetry add requests pandas black isort
    exec zsh

  '';
}
