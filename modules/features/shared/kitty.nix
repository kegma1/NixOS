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
      enableGitIntegration = true;
      keybindings = let
          mod = if pkgs.hostPlatform.isDarwin then "cmd" else "alt";
        in {
        "${mod}+1" = "goto_tab 1";
        "${mod}+2" = "goto_tab 2";
        "${mod}+3" = "goto_tab 3";
        "${mod}+4" = "goto_tab 4";
        "${mod}+5" = "goto_tab 5";
        "${mod}+6" = "goto_tab 6";
        "${mod}+7" = "goto_tab 7";
        "${mod}+8" = "goto_tab 8";
        "${mod}+9" = "goto_tab 9";
        "${mod}+0" = "goto_tab -1";

        "${mod}+w" = "close_tab";
        "${mod}+t" = "new_tab_with_cwd";

        "${mod}+n" = "next_tab";
        "${mod}+p" = "previous_tab";
      };
      settings = {
        font_size = 15;
        font_family = "Iosevka Nerd Font";
        shell = lib.getExe pkgs.zsh;

        window_padding_width = 10;
        allow_remote_control = "yes";
        shell_integration = "enabled";
        confirm_os_window_close = 0;
        disable_ligatures = "always";
        tab_bar_align = "center";
        macos_option_as_alt = "both";

      };
    };
  };
}
