{ self, inputs, ... }: {
  flake.nixosModules.desktopHardware = { config, lib, pkgs, modulesPath, ... }: {
	  imports =
	    [ (modulesPath + "/installer/scan/not-detected.nix")
	    ];

	  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
	  boot.initrd.kernelModules = [ ];
	  boot.kernelModules = [ "kvm-amd" ];
	  boot.extraModulePackages = [ ];

	  fileSystems."/" =
	    { device = "/dev/disk/by-uuid/160f216c-9696-4dd5-9b4a-612388d51811";
	      fsType = "btrfs";
	    };

	  fileSystems."/home" =
	    { device = "/dev/disk/by-uuid/160f216c-9696-4dd5-9b4a-612388d51811";
	      fsType = "btrfs";
	      options = [ "subvol=home" ];
	    };

	  fileSystems."/nix" =
	    { device = "/dev/disk/by-uuid/160f216c-9696-4dd5-9b4a-612388d51811";
	      fsType = "btrfs";
	      options = [ "subvol=nix" ];
	    };

	  fileSystems."/boot" =
	    { device = "/dev/disk/by-uuid/12E3-D43B";
	      fsType = "vfat";
	      options = [ "fmask=0077" "dmask=0077" ];
	    };

	  swapDevices =
	    [ { device = "/dev/disk/by-uuid/485a1195-1c8f-4733-bac5-b51604cef59b"; }
	    ];

	  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	};

}
