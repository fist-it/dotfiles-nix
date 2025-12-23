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
  };

  outputs = { self, nixpkgs, home-manager, darwin, ... }@inputs: {
    nixosConfigurations.nixPC = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = { inherit inputs; };

      modules = [
        ./configuration.nix

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

    darwinConfigurations.darwin = darwin.lib.darwinSystem
      {
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
            home-manager.users.fist_it = { ... }: {
              imports = [ ./modules/home.nix ];
              sysInfo = {
                username = "fist_it";
                homeDirectory = "/Users/fist_it";
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
