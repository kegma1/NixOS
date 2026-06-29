{ self, ...}: {
  flake.nixosModules.discord = { pkgs, ... }: {
    imports = [
      self.nixosModules.flatpak
    ];
    environment.systemPackages = [
      pkgs.discord
    ];
    services.flatpak.packages = [
       "com.discordapp.Discord"
    ];
  };
}
