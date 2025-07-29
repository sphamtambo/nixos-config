{
  description = "NixOS and Standaline home-manager config";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib = {
      url = "github:hyprwm/contrib";
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvimed = {
      url = "github:sphamtambo/nixvim-config";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      hyprland,
      nixvimed,
      ...
    }@inputs:
    let
      inherit (self) outputs;

      username = "sphalo";
      hostname = "nixos";
      systems = [ "x86_64-linux" ];

      forEachSystem = nixpkgs.lib.genAttrs systems;

      pkgsFor = import nixpkgs {
        inherit systems;
        config = {
          allowUnfree = true;
        };
        overlays = [
          (final: prev: {
            neovim = inputs.nixvimed.packages.${systems}.default;
          })
        ];
      };
    in
    {
      templates = import ./templates;
      homeManagerModules = import ./modules/home-manager;
      nixosModules = import ./modules/nixos;
      # overlays = import ./overlays {inherit inputs outputs;};
      formatter = forEachSystem (pkgs: pkgs.alejandra);
      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });

      # Builds the entire nixos system (home-manager modules)
      # 'nixos-rebuild switch --flake .#hostname'
      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = {
            inherit
              self
              system
              nixvimed
              hostname
              username
              inputs
              outputs
              ;
          };
          modules = [
            ./hosts/nixos/configuration.nix
            hyprland.nixosModules.default
            home-manager.nixosModules.home-manager
            { _module.args = { inherit inputs; }; }
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users."${username}" = import ./hosts/nixos/home.nix;
                extraSpecialArgs = specialArgs;
              };
            }
          ];
        };
      };

      # Only used for non nixos systems (Standalone home-manager)
      # 'home-manager --flake .#username'
      homeConfigurations = {
        "${username}" = home-manager.lib.homeManagerConfiguration {
          pkgs = pkgsFor.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/popos/home.nix
          ];
        };
      };
    };
}
