{
  stdenv,
  python,
}:
stdenv.mkDerivation {
  buildInputs = [python];
  name = "some-package";
  version = "0.0.1";
  src = ./.;
  poetryLock = ./poetry.lock;
}
