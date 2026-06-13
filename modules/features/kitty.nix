{ self, inputs, ... }: {
  flake.nixosModules.kitty = {pkgs, ...}: {
    environment.systemPackages= [self.packages.${pkgs.stdenv.hostPlatform.system}.myKitty];
  };
  perSystem = { pkgs, ... }: {
    packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;
      settings = {
        background_opacity = 0.75;
        background_blur = 0;
      };

      themeFile = "GruvboxMaterialDarkSoft";
    };
  };
}
