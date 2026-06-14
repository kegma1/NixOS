{ self, inputs, ... }: {
  flake.nixosModules.niri = { pkgs, lib, ... }: {
    programs.niri = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.myNiri;
    };
  };
  perSystem = { pkgs, lib, self',  ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
          "steam"
          [ "flatpak" "run" "com.discordapp.Discord" ]
        ];
        input = {
          focus-follows-mouse = _: {
            max-scroll-amount = "0%";
          };

          keyboard = {
            xkb = {
              layout = "no";
            };
            repeat-rate = 40;
            repeat-delay = 250;
          };

          touchpad = {
            natural-scroll = _: {};
            tap = _: {};
          };

          mouse = {
            accel-profile = "flat";
          };
        };

        outputs = {
          "DP-1" = {
            mode = "2560x1440@164.999";
            position = _:  {
              props = {
                x = 3440;
                y = 0;
              };
            };
          };     

          
          "DP-2" = {
            focus-at-startup = _: {};
            mode = "3440x1440@174.962";
            position = _:  {
              props = {
                x = 0;
                y = 0;
              };
            };
          };
        };

        prefer-no-csd = _: {};
        hotkey-overlay.skip-at-startup = _: {};

        layout = {
          gaps = 5;
          preset-column-widths = [
            { proportion = 0.5; }
            { proportion = 0.666667; }
            { proportion = 0.333333; }
          ];
        };
        
        window-rule = {
          geometry-corner-radius = 12;
          clip-to-geometry = true;
          background-effect.blur = true;
        };
        
        xwayland-satellite.path =
          lib.getExe pkgs.xwayland-satellite;

        binds = {
          "Mod+S".spawn-sh =
            "${lib.getExe self'.packages.myNoctalia} ipc call launcher toggle";
          "Mod+Return".spawn-sh = lib.getExe self'.packages.myKitty;
          "Mod+Q".close-window = _: {};
          
          "Mod+D".spawn-sh = lib.getExe (inputs.wrapper-modules.wrappers.wlr-which-key.wrap {
              inherit pkgs;
              settings = {
                anchor = "center";
                menu = [
                  {
                    key = "d";
                    desc = "Discord";
                    cmd = "flatpak run com.discordapp.Discord";
                  }
                  {
                    key = "z";
                    desc = "Zen";
                    cmd = "flatpak run app.zen_browser.zen";
                  }
                ];
              };
            }
          );                    
          "Mod+F".maximize-column = _: {};
          "Mod+G".fullscreen-window = _: {};
          "Mod+Shift+F".toggle-window-floating = _: {};
          "Mod+Ctrl+F".expand-column-to-available-width = _: {};
          "Mod+C".center-column = _: {};
          "Mod+W".toggle-column-tabbed-display = _: {};
          "Mod+R".switch-preset-column-width = _: {};

          "Mod+H".focus-column-left = _: {};
          "Mod+L".focus-column-right = _: {};
          "Mod+K".focus-window-up = _: {};
          "Mod+J".focus-window-down = _: {};

          "Mod+Left".focus-column-left = _: {};
          "Mod+Right".focus-column-right = _: {};
          "Mod+Up".focus-window-up = _: {};
          "Mod+Down".focus-window-down = _: {};

          "Mod+Comma".consume-or-expel-window-left = _: {};
          "Mod+Period".consume-or-expel-window-right = _: {};

          "Mod+Shift+H".move-column-left = _: {};
          "Mod+Shift+L".move-column-right = _: {};
          "Mod+Shift+K".move-window-up = _: {};
          "Mod+Shift+J".move-window-down = _: {};

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;
          "Mod+0".focus-workspace = 0;

          "Mod+Shift+1".move-column-to-workspace = 1;
          "Mod+Shift+2".move-column-to-workspace = 2;
          "Mod+Shift+3".move-column-to-workspace = 3;
          "Mod+Shift+4".move-column-to-workspace = 4;
          "Mod+Shift+5".move-column-to-workspace = 5;
          "Mod+Shift+6".move-column-to-workspace = 6;
          "Mod+Shift+7".move-column-to-workspace = 7;
          "Mod+Shift+8".move-column-to-workspace = 8;
          "Mod+Shift+9".move-column-to-workspace = 9;
          "Mod+Shift+0".move-column-to-workspace = 0;

          "Mod+WheelScrollDown".focus-column-left = _: {};
          "Mod+WheelScrollUp".focus-column-right = _: {};
          "Mod+Ctrl+WheelScrollDown".focus-workspace-down = _: {};
          "Mod+Ctrl+WheelScrollUp".focus-workspace-up = _: {};

          "Print".screenshot-screen = _: {};
          "Mod+Shift+S".screenshot = _: {};
          "Alt+Print".screenshot-window = _: {};
        };
      };
    };
  };
}
