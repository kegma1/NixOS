{ self, ... }: {
  flake.nixosModules.zen = {...}: {
    imports = [
      self.nixosModules.flatpak
    ];
    services.flatpak.packages = [
      "app.zen_browser.zen"
    ];
  };
}
