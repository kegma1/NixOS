{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.wlogout = {pkgs, config, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    programs.wlogout = {
      enable = true;
      style = /*css*/ ''
          
      '';
      layout = [
        {
          action = "systemctl poweroff";
          keybind = "s";
          label = "shutdown";
          text = "Shutdown";
        }
        {
          action = "systemctl reboot";
          keybind = "r";
          label = "reboot";
          text = "Reboot";
        }
        {
          action = "";
          keybind = "l";
          label = "lock";
          text = "Lock";
        }
        {
          action = "niri msg action quit";
          keybind = "e";
          label = "logout";
          text = "Logout";
        }
        {
          action = "systemctl suspend";
          keybind = "u";
          label = "suspend";
          text = "Suspend";
        }
        {
          action = "systemctl hibernate";
          keybind = "h";
          label = "hibernate";
          text = "Hibernate";
        }
        {
          action = "systemctl poweroff --firmware-setup";
          keybind = "b";
          label = "bios";
          text = "BIOS";
        }
      ];
    };
  };
}
