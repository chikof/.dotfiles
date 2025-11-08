{
  description = "My NixOS Configuration";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      settings = {
        username = "chiko";
        configs = [
          "nvim"
          "zen"
          "hyprland"
        ];
      };
    in

    {
      nixosConfigurations.desktop = nixpkgs.lib.nixosSystem {
        system = [ "x86_64-linux" ];
        specialArgs = {
          inherit self inputs outputs;
        }
        // settings;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users."${settings.username}" = ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
