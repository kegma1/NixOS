{ self, ... }: {
  flake.nixosModules.flatpak = {...}: {
    services.flatpak = {
      enable = true;
      remotes = [{
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }];
    };

  };
}
