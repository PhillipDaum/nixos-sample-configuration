# Edit this configuration file to do stuff

{ config, pkgs, ... }:

{
imports = [
	./home-manager/home.nix
	./hardware-configuration.nix
	./containers/jellyfin.nix
	<home-manager/nixos>
];

# GUI
services.xserver.enable = true;
services.xserver.displayManager.gdm.enable = true;
services.xserver.desktopManager.gnome.enable = true;

# Disks
fileSystems."/media" =
	{ device = "/dev/disk/by-uuid/your-device's-uuid";
	fsType = "ext4";
	};
fileSystems."/stuffs" =
	{ device = "/dev/disk/by-uuid/your-device's-uuid";
	fsType = "ext4";
	};
fileSystems."/other-stuffs" =
	{ device = "/dev/disk/by-uuid/your-device's-uuid";
	fsType = "ext4";
	};

# Bootloader.
boot.loader.grub.enable = true;
boot.loader.grub.device = "/dev/nvme0n1";
boot.loader.grub.useOSProber = true;

networking.hostName = "your-hostname"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
# Enable networking
networking.networkmanager.enable = true;

# Set your time zone.
time.timeZone = "America/Boise";

# Select internationalisation properties.
i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = {
LC_ADDRESS = "en_US.UTF-8";
LC_IDENTIFICATION = "en_US.UTF-8";
LC_MEASUREMENT = "en_US.UTF-8";
LC_MONETARY = "en_US.UTF-8";
LC_NAME = "en_US.UTF-8";
LC_NUMERIC = "en_US.UTF-8";
LC_PAPER = "en_US.UTF-8";
LC_TELEPHONE = "en_US.UTF-8";
LC_TIME = "en_US.UTF-8";
};

# Configure keymap in X11
services.xserver.xkb.layout = "us";
services.xserver.xkb.variant = "";

# Enable CUPS to print documents.
services.printing.enable = true;

# Enable sound with pipewire.
sound.enable = true;
hardware.pulseaudio.enable = false;
security.rtkit.enable = true;
services.pipewire = {
enable = true;
alsa.enable = true;
alsa.support32Bit = true;
pulse.enable = true;
# If you want to use JACK applications, uncomment this
#jack.enable = true;
#media-session.enable = true;
};

# Enable touchpad support (enabled default in most desktopManager).
# services.xserver.libinput.enable = true;

# Allow unfree packages
nixpkgs.config.allowUnfree = true;

# List packages installed in system profile. To search, run:
# $ nix search wget
environment.systemPackages = with pkgs; [
	wget
	vim
	git
	gparted
	libreoffice
	xournalpp
	zoom-us
	ungoogled-chromium
	vlc
	python3
	endeavour
	#conda
	gthumb
	gimp
	inkscape-with-extensions
];

 environment.gnome.excludePackages = (with pkgs; [
              gnome-photos
              gnome-tour
		    rhythmbox
            ]);

programs.steam = {
	enable = true;
	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
 };

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
programs.mtr.enable = true;
programs.gnupg.agent = {
	enable = true;
	enableSSHSupport = true;
};

## List services that you want to enable:

# Enable the OpenSSH daemon.
services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
networking.firewall.enable = true;

# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
system.stateVersion = "unstable"; # Did you read the comment?

}
