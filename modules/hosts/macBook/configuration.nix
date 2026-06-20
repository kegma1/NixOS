{ self, inputs, ... }: {
  flake.darwinModules.macBookConfiguration = { config, pkgs, ... }: {
    imports =
      [ 
      ];
    fonts.packages = with pkgs; [
      nerd-fonts.comic-shanns-mono
    ];
    
    nixpkgs.hostPlatform = "aarch64-darwin";
    system.stateVersion = 6;

    nix.settings.experimental-features = ["nix-command" "flakes"];

    nixpkgs.config.allowUnfree = true;
    networking.hostName = "macBook"; 
  
    time.timeZone = "Europe/Oslo";

    environment.systemPackages = with pkgs; [
       helix
       self.packages.${pkgs.stdenv.hostPlatform.system}.myKitty
       self.packages.${pkgs.stdenv.hostPlatform.system}.myNh
       self.packages.${pkgs.stdenv.hostPlatform.system}.myFastfetch
     ];
   };
}
