{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.librewolf = {pkgs, ...}: {
    programs.librewolf = {
      enable = true;
      profiles.Kennet = {
        extensions = {
          packages = with inputs.firefox-addons.packages."${pkgs.stdenv.hostPlatform.system}"; [
            bitwarden
            ublock-origin
            sidebery
          ];
        };

        search.engines = {
          nix-packages = {
            name = "Nix Packages";
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "type";
                    value = "packages";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];

            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@np"];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [{template = "https://wiki.nixos.org/w/index.php?search={searchTerms}";}];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = ["@nw"];
          };

          bing.metaData.hidden = true;
          google.metaData.alias = "@g"; # builtin engines only support specifying one additional alias
        };
      };
    };
    stylix.targets.librewolf.profileNames = ["Kennet"];
  };
}
