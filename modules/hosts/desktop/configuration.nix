{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktopConfiguration = {
    config,
    lib,
    pkgs,
    ...
  }: let
    selfpkgs = self.packages."${pkgs.stdenv.hostPlatform.system}";
  in {
    imports = [
      self.nixosModules.desktopHardware
      self.nixosModules.niri
      self.nixosModules.zen
      self.nixosModules.discord
      self.nixosModules.gaming
      self.nixosModules.emulation
      self.nixosModules.gpu-screen-recorder
      self.nixosModules.via-qmk
      self.nixosModules.creative
      self.nixosModules.printer
      self.nixosModules.appimage

      self.sharedModules.theme

      self.sharedModules.nix
      self.sharedModules.fonts
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    boot.kernelParams = ["quiet"];
    boot.plymouth.enable = true;

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Oslo";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;
    services.gvfs.enable = true;
    services.udisks2.enable = true;

    # programs.coolercontrol.enable = true;

    programs.nix-index-database.comma.enable = true;

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
      config = {
        common.default = ["gtk" "gnome"];
      };
    };

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs;[
          stdenv.cc.cc

      # X11
      libX11
      libXcursor
      libXi
      libXrandr
      libXrender
      libXext
      libXfixes

      # Wayland
      wayland
      libxkbcommon

      # Graphics
      libGL
      vulkan-loader

      # Audio
      alsa-lib
      libpulseaudio
    ];    
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    hardware.graphics.enable = true;
    hardware.graphics.enable32Bit = true;
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.open = true; 
    hardware.nvidia.modesetting.enable = true;
    hardware.cpu.amd.updateMicrocode = true;

    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "no";
      variant = "";
    };

    # Configure console keymap
    console.keyMap = "no";

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;

    programs.firefox.enable = true;

    networking.hostName = "desktop";

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users."kennet" = {
      isNormalUser = true;
      description = "Kennet";
      extraGroups = ["networkmanager" "wheel"];
      packages = with pkgs; [
      ];
    };
    home-manager.users."kennet" = self.homeModules.kennetModule;

    environment.systemPackages = [
    ];

    system.stateVersion = "26.05";
  };
}
