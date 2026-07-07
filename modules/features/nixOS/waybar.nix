{ lib, self, inputs,  ... }: {
  flake.homeModules.waybar = { pkgs,  ... }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in  {
    programs.waybar = {
      enable = true;    
      settings = {
        mainbar = {
          layer = "top";
          position = "left";
          width = 1000;

          modules-left = ["custom/icon" "cava"];
          modules-center = ["clock" "niri/workspaces" "clock#date"];
          modules-right = ["pulsaudio" "newtwork" "tray"];
          

          "niri/workspaces" = {
            format = "";
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
          	actions = {
          		on-click-right = "mode";
          	};
          };
          "custom/icon" = {
            format = " ";
          };
        };
      };
    };
  };
}
