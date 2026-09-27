# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{  
 imports = [ ./hardware-configuration.nix ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
};
  networking.hostName = "MobileSnowflake"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.wireless.networks ={
  	"Oscarshouse" = {
		psk = "5m!le4Me";
	};
  };
  programs.nix-ld.enable = true;
  # Set your time zone.
  time.timeZone = "America/New_York";

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
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };


  #hyprland
  programs.hyprland.enable = true;

  #Login Screen
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;

  #Gamming/steam
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true;
  dedicatedServer.openFirewall = true;
  };

  hardware.graphics = {
  	enable = true;
	enable32Bit = true;

};

environment.systemPackages = with pkgs; [
  # ... existing packages ...
  brightnessctl
];
programs.zsh.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.masterviod = {
    isNormalUser = true;
    description = "MasterViod";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    shell= pkgs.zsh;
    packages = with pkgs; [
	hyprland
	kitty
	zsh
	rofi
	wl-clipboard
	dunst
	zed-editor
	neovim
	steam
	tmux
	tree
	gcc
	cargo
	rust-analyzer
	jdk21
	maven
	gradle
	python312
	python312Packages.pip
	python312Packages.virtualenv
	nodejs_24
	typescript
	yarn
	pnpm
	postgresql
	podman
	podman-compose
	deno
	bun
	docker_29
	alacritty
	gnumake
	git
	ripgrep
	fd
	bat
	lazygit
	ruff
	gnutar
	curl
	p7zip
	ranger
	tldr
	eza
	fastfetch
	bottom
	chafa
	zoxide
	openssh
	godot
	pipewire
	pwvucontrol
	kdePackages.dolphin
	brave
	quickshell
	virt-manager
	discord
	signal-desktop
	vlc
	spotify
	noisetorch
	obs-studio
	ffmpeg_7-full
	krita
	gimp
	inkscape
	blender
	kdePackages.kdenlive
	kdePackages.gwenview
	heroic
	lutris
	piper
	libratbag
	gamemode
	gamescope
	mangohud
	retroarch
	prismlauncher
	protonplus
	cockatrice
	stockfish
	cutechess
	blueman
	onlyoffice-desktopeditors
	hyprpaper
	emote
	cockatrice
	obsidian
	calibre
	vscodium
	mission-center	
	clang
	clang-tools
	unzip
	papirus-icon-theme
    starship
        
    ];

  };

fonts.packages = with pkgs; [
  nerd-fonts.fira-code
  fira-code
];
  nixpkgs.config.permittedInsecurePackages = [
  "electron-39.8.10"
];
nix.settings.experimental-features = [ "nix-command" "flakes" ];

services.upower.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
   networking.firewall.allowedTCPPortRanges = [ {from = 27015; to = 27050;}  ];
   networking.firewall.allowedUDPPortRanges = [ {from = 27015; to = 27050;}  ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
