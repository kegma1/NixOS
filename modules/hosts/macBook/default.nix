{ self, inputs, ... }: {
  flake.darwinConfigurations.macBook = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.darwinModules.macBookConfiguration
      inputs.stylix.darwinModules.stylix
      self.darwinModules.myHomeManager
     ];
  };
  flake.homeConfigurations.kennetmathisen = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs { system = "aarch64-darwin"; };
    modules = [
      self.homeModules.kennetmathisenModule
      {
        home.username = "kennetmathisen";
        home.homeDirectory = "/Users/kennetmathisen/";
      }
    ];
  };
}
