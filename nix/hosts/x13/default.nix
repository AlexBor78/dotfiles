# /nix/hosts/x13/default.nix
{ lexalib, dotsroot, ... }: {
	imports = [
		./hardware-configuration.nix
		./disks.nix
		(builtins.fetchTarball {
				url = "https://github.com/MrShitFox/happ-nixos/archive/main.tar.gz";
			sha256 = "06y6l0lkv75dw0ln1mgsq3blvjjx5vmdm0mqb5kgpl91irnjmdhf";
		} + "/happ-module.nix")
		./services.nix
		./user.nix
		./pkgs.nix
	];

	# for dark theme
	programs.dconf.enable = true;

	# builder
	nix.distributedBuilds = true;
	nix.buildMachines = [{
		hostName = lexalib.infra.maria.ip;
		sshUser = "builder";
		system = "x86_64-linux";
		maxJobs = 2;
		speedFactor = 1;
		supportedFeatures = [ "nixos-test" "benchmark" "big-parallel" "kvm" ];
	}];

	nix.settings.builders-use-substitutes = true;
	# nix.settings.max-jobs = 0; # add when will have less rebuild
	nix.settings.connect-timeout = 5;

  # Bootloader (grub)
  boot.loader.grub = {
		extraEntries = ''
			menuentry "Arch Linux" {
			  insmod part_gpt
			  insmod fat
			  search --no-floppy --fs-uuid --set=root CC55-BFC7
			  linux /vmlinuz-linux root=/dev/mapper/laptop-arch rw
			  initrd /initramfs-linux.img
			}
		'';
  };

	sops.age.keyFile = "/data/secrets/sops/age/keys.txt";
	sops.secrets.builder-access-root = {
		sopsFile = "${dotsroot}/secrets/x13/ssh.yaml";
		key = "builder-access";
		path = "/root/.ssh/id_ed25519";
	};
	programs.ssh.knownHosts.maria = {
		hostNames = [ lexalib.infra.maria.ip ];
		publicKey = lexalib.infra.maria.public-ssh-keys.default;
	};

#  boot.kernelParams = [
#    "nohz_idle=on"
#    "processor.ignore_ppc=1"
#    "acpi_cpufreq.enable_pcc=false"
#    "amd_pstate=disable"
#  ];

}
