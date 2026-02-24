{ config, lib, pkgs, hostname,  ... }: 
let
  
  mkExt4 = device: {
    device = lib.mkForce device;
    fsType = "ext4";
    options = [ "defaults" "noatime" ];
  };
  
  mkFat = device: {
    device = lib.mkForce device;
    fsType = "vfat";
    options = [ "defaults" "noatime" ];
  };
  
  mkBtrfs = device: {
    device = lib.mkForce device;
    fsType = "btrfs";
    options = [ "defaults" "noatime" "compress=zstd" ];
  };

in {
  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  fileSystems = {
    "/" =     mkExt4  "/dev/laptop/nixos_root";
    "/boot" = mkFat   "/dev/disk/by-label/boot";
    "/home" = mkBtrfs "/dev/laptop/nixos_home";
  };

  # Bootloader (grub)
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      devices = [ "nodev" ];
      useOSProber = true;
    };
  };


  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  boot.kernelParams = [
    "zswap.enabled=1"
    "zswap.compressor=zstd"
    "zswap.max_pool_percent=20"
    "zswap.zpool=z3fold"     # или "zsmalloc"
  ];

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  networking.hostName = hostname; # Define your hostname.
  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;


  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
