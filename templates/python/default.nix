{ pkgs ? import <nixpkgs> {} }:

pkgs.python3.pkgs.buildPythonPackage rec {
  pname = "foo-bar";
  version = "0.1.0";

  src = ./.;
}

