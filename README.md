# NixOS and Standalone Home-Manager Configuration

This repository contains the NixOS and Standalone Home-Manager configuration for my system.

## Repository Structure

- `modules/`: Contains NixOS and Home-Manager modules used for system and user configurations.
- `overlays/`: Provides overlays for customizing packages and dependencies.
- `pkgs/`: Custom packages and modules for system and user environments.
- `templates/`: Templates used for generating configuration files.
- `hosts/`: Host-specific configurations for NixOS and Home-Manager.

## Configuration

### NixOS Configurations

- The `nixosConfigurations` section defines NixOS system configurations.
- Each configuration is specified by a hostname and includes modules for system setup and Home-Manager integration.
- Home-Manager modules are used to manage user-specific configurations.
- Run `nixos-rebuild switch --flake .#hostname` to build and switch to the specified hostname configuration.

### Home-Manager Configurations

- The `homeConfigurations` section defines Standalone Home-Manager configurations.
- Each configuration is specified by a username and includes modules for managing user-specific environments.
- Run `home-manager --flake .#username` to apply the specified username configuration.
