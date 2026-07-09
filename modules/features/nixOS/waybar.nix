{ lib, self, inputs,  ... }: {
  flake.homeModules.waybar = { pkgs,  ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in  {
    programs.waybar = {
      enable = true;    
      settings = {
        mainbar = {
          layer = "top";
          position = "top";
          width = 1000;

          modules-left = ["custom/icon" "cava"];
          modules-center = ["clock" "niri/workspaces" "clock#date"];
          modules-right = ["pulseaudio" "newtwork" "tray"];
          

          "clock" = {
            format = "{:%H:%M}";
          };
          "clock#date" = {
            format = "{:%d日%m月}";
          };
          "niri/workspaces" = {
            format = "{icon}";
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
          	format-icons = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ] ;
          	# actions = {
          	# 	on-click-right = "mode";
          	# };
          };
          "custom/icon" = {
            format = " ";
          };
        };
      };
    };
  };
}
