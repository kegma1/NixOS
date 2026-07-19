{
  self,
  inputs,
  ...
}: {
  flake.homeModules.oh-my-posh = {
    pkgs,
    config,
    ...
  }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
    colors = config.lib.stylix.colors;
  in {
    programs.oh-my-posh = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        blocks = [
          {
            type = "prompt";
            newline = true;
            alignment = "left";
            segments = [
              {
                type = "session";
                background = "#${colors.base01}";
                foreground = "#${colors.base05}";
                style = "plain";
                template = " {{ .UserName }}@{{ .HostName }} ";
              }
              {
                type = "path";
                background = "#${colors.base02}";
                foreground = "#${colors.base05}";
                style = "plain";
                properties.style = "full";
                template = " {{ .Path }} ";
              }
              {
                type = "executiontime";
                background = "#${colors.base03}";
                foreground = "#${colors.base05}";
                style = "plain";
                template = " {{ .FormattedMs }} ";
                options = {
                  threshold = 500;
                  style = "austin";
                  always_enabled = false;
                };
              }
              {
                type = "git";
                background = "#${colors.base05}";
                foreground = "#${colors.base01}";
                # template = "{{ .UpstreamIcon }} {{ .HEAD }}{{if .Behind }} {{ .Behind }}{{ end }}{{if .Ahead }} {{ .Ahead }}{{ end }} ";
                template = "{{ .UpstreamIcon }} {{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }}  {{ .StashCount }}{{ end }} ";
                options = {
                  fetch_status = true;
                  fetch_push_status = true;
                };
              }
            ];
          }
          # {
          #   type = "prompt";
          #   alignment = "right";
          #   # filler = ".";
          #   segments = [
          #     {
          #       type = "executiontime";
          #       style = "plain";
          #       template = "{{ .FormattedMs }}";
          #       options = {
          #         threshold = 500;
          #         style = "austin";
          #         always_enabled = true;
          #       };
          #     }
          #     {
          #       type = "time";
          #       style = "plain";
          #       template = " {{ .Format }} ";
          #     }
          #   ];
          # }
          {
            type = "prompt";
            newline = true;
            alignment = "left";
            segments = [
              {
                type = "os";
                style = "plain";
                foreground_templates = [
                  "{{if ne .Code 0}}#${colors.base08}{{end}}"
                  "{{if eq .Code 0}}#${colors.base05}{{end}}"
                ];
                background = "transparent";
                template = "{{ .Icon }}  ";
              }
            ];
          }
        ];
      };
    };
  };
}
