{ inputs, self, ... }: {
  flake.nixosModules.emulation = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      dolphin-emu
    ];
  };
}
