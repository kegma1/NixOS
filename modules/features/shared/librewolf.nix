{
  lib,
  self,
  inputs,
  ...
}: {
  flake.homeModules.librewolf = {pkgs, ...}: {
    programs.librewolf = {
      enable = true;
      policies.ExtensionSettings = {
        "{c5aac142-6134-4857-81a9-6a5fc9da2355}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/gruvbox-d-m/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      profiles.Kennet = {
        userChrome = ''
          #TabsToolbar { display: none !important;}
          #sidebar-splitter { width: 5px !important; }
          #sidebar-panel-header { display: none !important; }
          #sidebar-header { display: none !important; }
          #sidebar-box {
            min-width: 0 !important;
            padding: 0 !important;
          }

        '';
        extensions = {
          packages = with inputs.firefox-addons.packages."${pkgs.stdenv.hostPlatform.system}"; [
            bitwarden
            ublock-origin
            sidebery
          ];
        };
        settings = {
          "webgl.disabled" = false;
          "privacy.resistFingerprinting" = false;
          "privacy.clearOnShutdown.history" = false;
          "privacy.clearOnShutdown.cookies" = false;
          "network.cookie.lifetimePolicy" = 0;
          "sidebar.position_start" = false;
          "extensions.autoDisableScopes" = 0;
          "browser.toolbars.bookmarks.visibility" = "never";
        };

        search.force = true;
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
        };
      };
    };
    xdg.mimeApps = {
      enable = pkgs.stdenv.isLinux;
      defaultApplications = {
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
      };
    };
    stylix.targets.librewolf.profileNames = ["Kennet"];
  };
}
