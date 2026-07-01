{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.myFastfetch = inputs.wrapper-modules.wrappers.fastfetch.wrap {
      inherit pkgs;
      settings = {
        logo = {
          source = "~/NixOS/boykisser.txt";
          type = "file";
        };
        display = {
          # separator = " ";
          separator = "│ ";
        };
        modules = [
          "title"
          {
            type = "custom";
            format = "╭──┬─────────────────────────────────╮";
          }
          {
            type = "os";
            key = "│ ";
            condition = {
              system = "Linux";
            };
            format = "{pretty-name}";
          }
          {
            type = "os";
            key = "│ ";
            condition = {
            system = "macOS";
            };
            format = "{pretty-name}";
          }
          {
            type = "packages";
            key = "│󰏖 ";
            format = "{?flatpak-all}{flatpak-all} ( ) {?}{?nix-all}{nix-all} ( ) {?}{?brew}{brew} (){?}";
          }
          {
            type = "kernel";
            key = "│ ";
          }
          {
            type = "cpu";
            key = "│ ";
            format = "{name}";
          }
          # {
          #   type = "command";
          #   key = "│󰢮 ";
          #   text = "nvidia-smi --query-gpu=name --format=csv,noheader";
          #   format = "{result}";
          #   condition = {
          #     system = "Linux";
          #   };
          # }
          {
            type = "gpu";
            key = "│󰢮 ";
            format = "{name}";
            # condition = {
            #   system = "macOS";
            # };
          }
          {
            type = "memory";
            key = "│ ";
          }
          {
            type = "uptime";
            key = "│ ";
            format = "{formatted}";
          }
          {
            type = "command";
            key = "│󰪺 ";
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
            format = "{result}";
          }
          {
            type = "custom";
            format = "╰──┴─────────────────────────────────╯";
          }
          {
            type = "colors";
            symbol = "circle";
          }
          
        ];
      };
    };
  };
}
