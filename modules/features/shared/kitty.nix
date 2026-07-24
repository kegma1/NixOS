{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.kitty = {pkgs, ...}: {
    imports = [
      self.homeModules.zsh
    ];

    programs.kitty = {
      enable = true;
      shellIntegration.enableZshIntegration = true;
      keybindings = {
        "ctrl+1" = "goto_tab 1";
        "ctrl+2" = "goto_tab 2";
        "ctrl+3" = "goto_tab 3";
        "ctrl+4" = "goto_tab 4";
        "ctrl+5" = "goto_tab 5";
      };
      settings = {
        font_size = 15;
        font_family = "Iosevka Nerd Font";
        shell = lib.getExe pkgs.zsh;

        window_padding_width = 10;
        allow_remote_control = "yes";
        shell_integration = "enabled";
        confirm_os_window_close = 0;
      };
    };
  };
}
