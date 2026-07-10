{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.waybar = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    stylix.targets.waybar.addCss = false;
    programs.waybar = {
      enable = true;
      style =
        lib.mkAfter
        /*
        css
        */
        ''
          * {
            all: unset;
            font-family: "Iosevka Nerd Font Propo", monospace;
          }

          window#waybar {
            background-color: alpha(@base00, 0.99);
            color: @base05;
            border-radius: 0 0 10px 10px;
            opacity: 0.99;
          }

          #workspaces {
            min-width: 100px;
            padding: 2px 4px;
            margin: 11px 0;
            border-radius: 10px;
          }

          #workspaces button {
            background-color: @base04;
            padding: 0px 5px;
            border-radius: 10px;
            margin: 0 2px;
            min-width: 4px;
          }

          #workspaces button.active {
            background-color: @base0D;
            min-width: 1.4rem;
            transition: none;
          }

          #clock
          #clock#date {
            margin: 0 15px;
            font-weight: 700;
            font-size: 1.12rem;
          }

          .modules-left {
            margin-left: 12px;
          }

          .module-right {
            margin-right: 12px;
          }
        '';
      settings = {
        mainbar = {
          layer = "top";
          position = "top";
          width = 1000;

          modules-left = ["custom/icon" "cava"];
          modules-center = ["clock" "niri/workspaces" "clock#date"];
          modules-right = ["pulseaudio" "network"];

          "clock" = {
            format = "{:%H時%M分}";
          };
          "clock#date" = {
            format = "{:%m月%d日}";
          };
          "niri/workspaces" = {
            format = "{icon}";
            format-icons = {
              "1" = "一";
              "2" = "二";
              "3" = "三";
              "4" = "四";
              "5" = "五";
              "6" = "六";
              "7" = "七";
              "8" = "八";
              "9" = "九";
              "10" = "十";
            };
          };
          "cava" = {
            # "cava_config": "$XDG_CONFIG_HOME/cava/cava.conf",
            framerate = 30;
            autosens = 0;
            sensitivity = 3;
            bars = 14;
            lower_cutoff_freq = 50;
            higher_cutoff_freq = 10000;
            method = "pulse";
            source = "auto";
            stereo = true;
            reverse = false;
            bar_delimiter = 0;
            monstercat = false;
            waves = false;
            noise_reduction = 0.17;
            input_delay = 2;
            format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
            # actions = {
            # 	on-click-right = "mode";
            # };
          };
          "network" = {
            format = "";
            format-wifi = " ";
            format-ethernet = "󰈀 ";
            format-disconnected = " ";
            tooltip-format = "{ifname}";
            tooltip-format-wifi = "{essid} ({signalStrength}%)";
            tooltip-format-ethernet = "{ifname}:{ipaddr} ({bandwidthUpBits}↑{bandwidthDownBits}↓)";
            tooltip-format-disconnected = "Disconnected";
          };
          "custom/icon" = {
            format = " ";
          };
        };
      };
    };
  };
}
