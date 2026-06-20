{ lib, self, inputs, ... }: {
  flake.nixosModules.kitty = {pkgs, ...}: {
    imports = [
      self.nixosModules.fonts
    ];
    environment.systemPackages= [self.packages.${pkgs.stdenv.hostPlatform.system}.myKitty];
  };
  perSystem = { pkgs, self',  ... }: {
    packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;
      settings = {
        font_size = 15;
        font_family = "ComicShannsMono Nerd Font";
        shell = lib.getExe self'.packages.myZsh;

        background_opacity = 0.75;
        background_blur = 5;
        
        allow_remote_control = "yes";
        shell_integration = "enabled";
      };

      themeFile = "GruvboxMaterialDarkSoft";
    };
  };
}
