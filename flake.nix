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
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    inputs.nixcord = {
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
    }:
    let
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
      nixosConfiguration.desktop = nixpkgs.lib.nixosSystem {
        system = [ "x86_64-linux" ];
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPkgs = true;
              user."${settings.username}" = ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
    };
}
