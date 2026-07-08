{ self, inputs, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.stylix.nixosModules.stylix
      inputs.nix-index-database.nixosModules.default
      self.nixosModules.desktopConfiguration
      self.nixosModules.myHomeManager
     ];
  };
  flake.homeConfigurations.kennet = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "x86_64-linux"; };
    modules = [
      self.homeModules.kennetModule
      {
        home.username = "kennet";
        home.homeDirectory = "/home/kennet";
      }
    ];
  };

}
