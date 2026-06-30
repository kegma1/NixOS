{ lib, self, inputs, ... }: {
  flake.homeModules.kitty = {pkgs, ...}: {
    programs.kitty = {
      enable = true;

      settings = {
        font_size = 15;
        font_family = "ComicShannsMono Nerd Font";
        shell = lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.myZsh;

        background_opacity = 0.75;
        background_blur = 5;
        allow_remote_control = "yes";
        shell_integration = "enabled";
      };

      themeFile = "GruvboxMaterialDarkSoft";
    };
  };
}
