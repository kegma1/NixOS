{...}: {
  flake.homeModules.noctalia = {pkgs, ...}: {
    programs.noctalia = {
      enable = true;
      package = pkgs.noctalia.overrideAttrs (old: {
        postPatch =
          (old.postPatch or "")
          + ''
            substituteInPlace src/shell/bar/widgets/workspaces_widget.cpp \
              --replace-fail \
                'label = std::to_string(workspace.index);' \
                'if (workspace.index <= 10) {
                    static constexpr const char* japanese[] = {
                        "一", "二", "三", "四", "五",
                        "六", "七", "八", "九", "十"
                    };
                    label = japanese[workspace.index - 1];
                } else {
                    label = std::to_string(workspace.index);
                }'
          '';
      });
    };
  };
}
