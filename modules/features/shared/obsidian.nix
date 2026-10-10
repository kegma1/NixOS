{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.obsidian = {pkgs, ...}: {
    programs.obsidian = {
      enable = true;
      cli.enable = true;
      vaults.notes = {
        target = "Documents/Obsidian";

        settings = {
          app = {
            vimMode = true;
          };

          corePlugins = [
            { name = "backlink"; }
            { name = "command-palette"; }
            { name = "daily-notes"; }
            { name = "editor-status"; }
            { name = "file-explorer"; }
            { name = "global-search"; }
            { name = "outgoing-link"; }
            { name = "outline"; }
            { name = "switcher"; }
            { name = "templates"; }
          ];
        };
      };
    };
  };
}
