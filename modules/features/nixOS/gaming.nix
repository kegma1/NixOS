{ self, inputs, ... }: {
  flake.nixosModules.gaming = { pkgs, lib, ... }: {
    hardware.graphics.enable = lib.mkDefault true;

    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        protontricks.enable = true;
        extraCompatPackages = with pkgs; [
          proton-ge-bin
        ]
        ;
      };
    };

    environment.systemPackages = with pkgs; [
      mangohud
      dxvk
      prismlauncher
    ];
  };
}
