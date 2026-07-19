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

    programs.coolercontrol.enable = true;

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

    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };

    hardware.graphics.enable = true;
    services.xserver.videoDrivers = ["nvidia"];
    hardware.nvidia.open = true; # see the note above
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
      pkgs.alacritty
      pkgs.spotify
      pkgs.localsend
      pkgs.libva-utils
      pkgs.mission-center
      pkgs.kdePackages.filelight
      pkgs.cava
      pkgs.qutebrowser
      pkgs.solaar
      pkgs.pavucontrol
      pkgs.libnotify
      pkgs.playerctl
      (pkgs.writeShellScriptBin "fixisaac"
        ''
          pid=$(pgrep -n -f 'isaac-ng.exe')

          sudo ${lib.getExe pkgs.gdb} -q -n -batch -p "$pid" \
          -ex 'set pagination off' \
          -ex 'python inf=gdb.selected_inferior(); inf.write_memory(0x00a9e941, bytes.fromhex("6a 01 ff 15 d8 82 b1 00 e9 50 01 00 00"))' \
          -ex 'python inf=gdb.selected_inferior(); inf.write_memory(0x00a9e9c6, bytes.fromhex("e9 76 ff ff ff"))' \
          -ex 'x/5bx 0x00a9e9c6' \
          -ex 'x/13bx 0x00a9e941' \
          -ex 'detach'
        '')
    ];

    system.stateVersion = "26.05";
  };
}
