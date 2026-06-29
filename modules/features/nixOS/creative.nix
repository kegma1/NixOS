{ inputs, self, ... }: {
  flake.nixosModules.creative = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      kdePackages.kdenlive
      krita
    ];
  };
}
