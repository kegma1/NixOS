
{ self, inputs, ... }: {
  flake.nixosModules.fastfetch= {pkgs, ...}: {
    environment.systemPackages= [self.packages.${pkgs.stdenv.hostPlatform.system}.myFastfetch];
  };
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
            format = "{pretty-name<31} │";
          }
          {
            type = "os";
            key = "│ ";
            condition = {
            system = "macOS";
            };
            format = "{pretty-name<31} │";
          }
          {
            type = "packages";
            key = "│󰏖 ";
            format = "";
          }
          {
            type = "kernel";
            key = "│ ";
            format = "{sysname} {release} │";
          }
          {
            type = "cpu";
            key = "│ ";
            format = "{name<31} │";
          }
          {
            type = "command";
            key = "│󰢮 ";
            text = "nvidia-smi --query-gpu=name --format=csv,noheader";
            format = "{result<31} │";
            condition = {
              system = "Linux";
            };
          }
          {
            type = "gpu";
            key = "│󰢮 ";
            format = "{name<31} │";
            condition = {
              system = "macOS";
            };
          }
          {
            type = "memory";
            key = "│ ";
          }
          {
            type = "uptime";
            key = "│ ";
            format = "{formatted<31} │";
          }
          {
            type = "command";
            key = "│󰪺 ";
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
            format = "{result<31} │";
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
