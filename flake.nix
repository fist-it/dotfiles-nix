{
  description = "fist-it's NixOS System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , darwin
    , sops-nix
    , nixos-wsl
    , ...
    }@inputs:
    {
      nixosConfigurations.nixPC = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = { inherit inputs; };

        modules = [
          ./hosts/nixPC

          sops-nix.nixosModules.sops

          ./modules/services
          {
            modules.services = {
              grafana.enable = false;
              direnv.enable = true;
            };

          }

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            # Pass inputs to home-manager so you can use them in home.nix
            home-manager.extraSpecialArgs = { inherit inputs; };

            # Point directly to your existing user config
            home-manager.users.fist-it = {
              imports = [ ./modules/home.nix ];
              sysInfo = {
                username = "fist-it";
                homeDirectory = "/home/fist-it";
              };
              modules.applications.desktop = {
                enable = true;
                hyprland.enable = true;
                xdg-entries = true;
              };
            };
          }
        ];
      };

      nixosConfigurations.nixWsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          nixos-wsl.nixosModules.default
          {
            system.stateVersion = "25.05";
            wsl.enable = true;
          }

          ./hosts/wsl

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";

            # Pass inputs to home-manager so you can use them in home.nix
            home-manager.extraSpecialArgs = { inherit inputs; };

            # Point directly to your existing user config
            home-manager.users.fist-it = {
              imports = [ ./modules/home.nix ];
              sysInfo = {
                username = "fist-it";
                homeDirectory = "/home/fist-it";
              };
              modules.applications.desktop = {
                enable = false;
                hyprland.enable = false;
                xdg-entries = false;
              };
            };
          }
        ];
      };

      darwinConfigurations.darwin = darwin.lib.darwinSystem {
        specialArgs = { inherit self inputs; };

        modules = [
          ./hosts/darwin

          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "old";

            # Pass inputs to home-manager so you can use them in home.nix
            home-manager.extraSpecialArgs = { inherit inputs; };

            # Point directly to your existing user config
            home-manager.users.fist-it =
              { ... }:
              {
                imports = [ ./modules/home.nix ];
                sysInfo = {
                  username = "fist-it";
                  homeDirectory = "/Users/fist-it";
                };
                modules.applications.desktop = {
                  enable = false;
                  hyprland.enable = false;
                  xdg-entries = false;
                };
              };
          }
        ];
      };
    };
}
