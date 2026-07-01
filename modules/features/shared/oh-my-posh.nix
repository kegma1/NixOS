{ self, inputs, ... }: {
  perSystem = { pkgs, ... }: {
    packages.myOh-my-posh= inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
      inherit pkgs;
      settings = {
        # transient_prompt = {
        #   template = " ";
        # };
        blocks = [
          {
            type = "prompt";
            newline = true;
            alignment = "left";
            segments = [
              {
                type = "path";
                background = "#464646";
                foreground = "#fffdd0";
                style = "plain";
                properties.style = "full";
                template = " {{ .Path }} ";
              }
              {
                type = "git";
                background = "#fffdd0";
                foreground = "#464646";
                # template = "{{ .UpstreamIcon }} {{ .HEAD }}{{if .Behind }} {{ .Behind }}{{ end }}{{if .Ahead }} {{ .Ahead }}{{ end }} ";
                template = "{{ .UpstreamIcon }} {{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }}  {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }}  {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }}  {{ .StashCount }}{{ end }} ";
                options = {
                  fetch_status = true;
                  fetch_push_status = true;
                };
              }
            ];
          }
          {
            type = "prompt";
            alignment = "right";
            # filler = ".";
            segments = [
              {
                type = "executiontime";
                style = "plain";
                template = "{{ .FormattedMs }}";
                options = {
                  threshold = 500;
                  style = "austin";
                  always_enabled = true;
                };
              }
              {
                type = "time";
                style = "plain";
                template = " {{ .Format }} ";
              }
            ];
          }
          {
            type = "prompt";
            newline = true;
            alignment = "left";
            segments = [
              {
                type = "os";
                style = "plain";
                template = "{{ .Icon }}  ";
              }
            ];
          }
        ];
      };
    };
  };
}
