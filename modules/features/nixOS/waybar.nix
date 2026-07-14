{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.waybar = {pkgs, config, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    stylix.targets.waybar.addCss = false;
    programs.waybar = {
      enable = true;
      systemd.enable = true;
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
            background-color: alpha(@base00, ${toString config.stylix.opacity.desktop});
            color: @base05;
            opacity: 0.99;
          }

          #cava {
            padding: 0 4px;
          }

          #custom-icon {
            font-weight: 700;
            font-size: 1.12rem;
          }

          #workspaces {
            padding: 0 4px;
          }

          #workspaces button {
            padding: 0 5px;
          }

          #workspaces button.active {
            background-color: @base05;
            color: @base01;
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

          modules-left = ["custom/icon" "niri/workspaces"];
          modules-center = ["clock" "cava" "clock#date"];
          modules-right = ["mpris" "custom/seperator" "cpu" "memory" "network" "power-profiles-daemon"];

          "mpris" = {
          	format = "{player_icon} {dynamic}";
          	format-paused = "{status_icon} <i>{dynamic}</i>";
          	tooltip = false;
          	dynamic-order = ["title" "artist"];
          	player-icons = {
          		default = "▶";
          	};
          	status-icons = {
          		paused = "⏸";
          	};
          };

          "power-profiles-daemon" = {
            format = "{icon}";
            tooltip = false;
            format-icons = {
              default = " ";
              performance = " ";
              balanced = " ";
              power-saver = " ";
            };
          };

          "clock" = {
            format = "{:%H時%M分}";
          };
          "clock#date" = {
            format = "{:%m月%d日}";
          };
          "niri/workspaces" = {
            format = "{icon}";
            display-condition = "only-populated";
            enable-bar-scroll = true;
            format-icons = {
              "1"  = "一";
              "2"  = "二";
              "3"  = "三";
              "4"  = "四";
              "5"  = "五";
              "6"  = "六";
              "7"  = "七";
              "8"  = "八";
              "9"  = "九";
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
            on-click = "pkill fuzzel || fuzzel";
          };
          "custom/seperator" = {
            format = " | ";
            tooltip = false;
          };
          "cpu" = {
          	interval = 1;
          	format = "{icon0}{icon1}{icon2}{icon3}{icon4}{icon5}{icon6}{icon7}{icon8}{icon9}{icon10}{icon11}{icon12}{icon13}{icon14}{icon15}{icon16}{icon17}{icon18}{icon19}{icon20}{icon21}{icon22}{icon23}{icon24}{icon25}{icon26}{icon27}{icon28}{icon29}{icon30}{icon31}  ";
          	format-icons = ["▁" "▂" "▃" "▄" "▅" "▆" "▇" "█"];
          };
          "memory" = {
          	interval = 30;
          	format = "{used:0.1f}G/{total:0.1f}G  ";
          };
        };
      };
    };
  };
}
