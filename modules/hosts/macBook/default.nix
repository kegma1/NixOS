{ self, inputs, ... }: {
  flake.darwinConfigurations.macBook = inputs.nix-darwin.lib.darwinSystem {
    modules = [
      self.darwinModules.macBookConfiguration
      self.darwinModules.myHomeManager
     ];
  };
}
