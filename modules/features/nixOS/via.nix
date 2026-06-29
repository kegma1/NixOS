{ inputs, self, ... }: {
  flake.nixosModules.via-qmk = { pkgs, ... }: {
    hardware.keyboard.qmk.enable = true;
    services.udev.packages = [ pkgs.via ];

    environment.systemPackages = with pkgs; [
      libusb1
      hidapi
      qmk
      via
    ];
  };
}
