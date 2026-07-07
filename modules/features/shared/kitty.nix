{ lib, self, inputs, ... }: {
  flake.homeModules.kitty = {pkgs, ...}: {
    imports = [
      self.homeModules.zsh
    ];
      
      programs.kitty = {
      enable = true;

      settings = {
        font_size = 15;
        font_family = "Iosevka Nerd Font";
        shell = lib.getExe pkgs.zsh;

        # background_opacity = 0.75;
        # background_blur = 5;
        allow_remote_control = "yes";
        shell_integration = "enabled";
        confirm_os_window_close = 0;
      };

      # themeFile = "GruvboxMaterialDarkSoft";
    };
  };
}
