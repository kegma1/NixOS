{ self, inputs, ... }: {
  flake.nixosModules.nh = {pkgs, ...}: {
    programs.nh = {
      enable = true;
      # flake = "/home/kennet/NixOS/";
      # package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNh;
    };
  };
  perSystem = { pkgs, ... }: {
    packages.myNh = inputs.wrapper-modules.wrappers.nh.wrap {
      inherit pkgs;
      flake = "$HOME/NixOS";
    };
  };
}
