{ lib, self, inputs, ... }: {
  flake.homeModules.kitty = {pkgs, ...}: {
    # imports = [
    #   self.nixosModules.fonts
    # ];
    
    programs.kitty = {
      enable = true;

      settings = {
        font_size = 15;
        font_family = "ComicShannsMono Nerd Font";
        shell = lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.myZsh;

        background_opacity = 0.75;
        background_blur = 0;

        allow_remote_control = "yes";
        shell_integration = "enabled";
      };

      themeFile = "GruvboxMaterialDarkSoft";
    };
  };
  # perSystem = { pkgs, self',  ... }: {
  #   packages.myKitty = inputs.wrapper-modules.wrappers.kitty.wrap {
  #     inherit pkgs;
  #     settings = {
  #       font_size = 15;
  #       font_family = "ComicShannsMono Nerd Font";
  #       shell = lib.getExe self'.packages.myZsh;

  #       background_opacity = 0.75;
  #       background_blur = 0;
        
  #       allow_remote_control = "yes";
  #       shell_integration = "enabled";
  #     };

  #     themeFile = "GruvboxMaterialDarkSoft";
  #   };
  # };
}
