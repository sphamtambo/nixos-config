{
  description = "Data Science Project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs = {self, nixpkgs, ...}:
    let
      system = "x86_64-linux";
	  pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs.python3Packages; [ 
		requests 
		pip 

		];
        pname = "python-dev-env";
        version = "1.0.0";
        src = ./.;
      };
    };
}
