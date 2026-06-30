{ self, inputs, ... }: {
  flake.darwinModules.macBookConfiguration = { config, pkgs, ... }: {
    imports =
      [ 
        self.sharedModules.cli
        self.sharedModules.nix
        self.sharedModules.fonts
      ];
    
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 6;

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

    environment.systemPackages = with pkgs; [
     ];
   };
}
