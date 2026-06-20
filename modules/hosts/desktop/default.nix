{ self, inputs, ... }: {
  flake.nixosConfigurations.desktop = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
      self.nixosModules.desktopConfiguration
      self.nixosModules.myHomeManager
     ];
  };
}
