{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.helix = {pkgs, ...}: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    programs.helix = {
      enable = true;
      defaultEditor = true;
      languages = {
        language = [
          {
            name = "nix";
            language-servers = ["nixd"];
          }
          {
            name = "typst";
            language-servers = ["tinymist" "typos"];
          }
        ];

        language-server.typos = {
          command = "typos-lsp";
          config.diagnosticSeverity = "Info";
        };

        language-server.nixd = {
          command = "nixd";

          config = {
            nixd = {
              formatting.command = ["alejandra"];

              nixpkgs.expr = "import (builtins.getFlake (toString ./.)).inputs.nixpkgs { }";
            };
          };
        };
      };
      settings = {
        editor = {
          bufferline = "multiple";
          soft-wrap.enable = true;
          auto-save.after-delay.enable = true;
          line-number = "relative";
          mouse = true;
          cursor-shape = {
            normal = "block";
            insert = "bar";
            select = "underline";
          };
        };
        keys = {
          normal = {
            esc = [
              "collapse_selection"
              "keep_primary_selection"
            ];
            # "C-g" = [":new" ":insert-output lazygit" ":buffer-close!" ":redraw"];
            # "C-y" = [
            #   ":sh rm -f /tmp/unique-file"
            #   ":insert-output yazi '%{buffer_name}' --chooser-file=/tmp/unique-file"
            #   ":sh printf '\x1b[?1049h\x1b[?2004h' > /dev/tty"
            #   ":open %sh{cat /tmp/unique-file}"
            #   ":redraw"
            # ];
          };
        };
      };
    };
  };
}
