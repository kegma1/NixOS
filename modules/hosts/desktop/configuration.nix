{ self, inputs, ... }: {
  flake.nixosModules.desktopConfiguration = { config, pkgs, ... }: {
    imports =
      [ 
        self.nixosModules.desktopHardware
        self.nixosModules.niri
        self.nixosModules.zen
        self.nixosModules.cli
        self.nixosModules.discord
        self.nixosModules.nix
        self.nixosModules.gaming
        self.nixosModules.emulation
        self.nixosModules.gpu-screen-recorder
        self.nixosModules.via-qmk
      ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
  
    networking.hostName = "desktop"; 
  
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

    programs.coolercontrol.enable = true;
   
    fileSystems."/mnt/ssd1" = {
      device = "/dev/disk/by-uuid/2d7e27ad-e4dd-47c4-a53e-d807265d083d";
      fsType = "btrfs";
    };

    fileSystems."/mnt/m2_1tb" = {
      device = "/dev/disk/by-uuid/5335522b-f978-47a1-adf7-9052901bb3a4";
      fsType = "ext4";
    };

    services.gvfs.enable = true;
    services.udisks2.enable = true;
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;


    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-gnome
      ];
      config = {
        common.default = [ "gtk" "gnome" ];
      };
    };

    hardware.graphics.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware.nvidia.open = true;  # see the note above
    hardware.cpu.amd.updateMicrocode = true;

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
  
    # Configure keymap in X11
    services.xserver.xkb = {
      layout = "no";
      variant = "";
    };
  
    # Configure console keymap
    console.keyMap = "no";
  
    # Enable CUPS to print documents.
    services.printing.enable = true;
  
    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;
  
      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  
    # Enable touchpad support (enabled default in most desktopManager).
    services.libinput.enable = true;
  
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users."kennet" = {
      isNormalUser = true;
      description = "Kennet";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
      ];
    };
  
    programs.firefox.enable = true;
  
    environment.systemPackages = with pkgs; [
      # kitty
      alacritty
      localsend
      libva-utils
    ];

    system.stateVersion = "26.05";
   };
}
