{
  self,
  inputs,
  ...
}: {
  flake.darwinModules.macBookConfiguration = {
    config,
    pkgs,
    ...
  }: {
    imports = [
      # self.sharedModules.cli
      self.sharedModules.nix
      self.sharedModules.fonts
      self.sharedModules.theme
    ];

    # virtualisation.containers.enable = true;
    # virtualisation.podman = {
    #   enable = true;

    #   # Create a `docker` alias for podman, to use it as a drop-in replacement
    #   dockerCompat = true;

    #   # Required for containers under podman-compose to be able to talk to each other.
    #   defaultNetwork.settings.dns_enabled = true;
    # };

    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 6;

    system.primaryUser = "kennetmathisen";
    homebrew.enable = true;
    homebrew.brews = [
      "open-mpi"
    ];

    nix.settings.experimental-features = ["nix-command" "flakes"];

    nixpkgs.config.allowUnfree = true;
    networking.hostName = "macBook";

    time.timeZone = "Europe/Oslo";
    users.users."kennetmathisen" = {
      name = "kennetmathisen";
      home = "/Users/kennetmathisen";
    };
    home-manager.users."kennetmathisen" = self.homeModules.kennetmathisenModule;
    security.pam.services.sudo_local.touchIdAuth = true;

    system.keyboard = {
      enableKeyMapping = true;
      remapCapsLockToEscape = true;
    };

    environment.systemPackages = with pkgs; [
    ];
  };
}
