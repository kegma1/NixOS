{ self, inputs, ... }: {
  flake.nixosModules.kitty = {pkgs, ...}: {
    environment.systemPackages= [self.packages.${pkgs.stdenv.hostPlatform.system}.myKitty];
  };
  perSystem = { pkgs, ... }: {
    packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
      inherit pkgs;
      settings = {
        font_size = 15;
        font_family = "ComicShannsMono Nerd Font";

        background_opacity = 0.75;
        background_blur = 0;
        
        allow_remote_control = "yes";
        # shell_integration = "enabled";
      };

      themeFile = "GruvboxMaterialDarkSoft";
    };
  };
}
