# /nix/hosts/x13/default.nix

{ ... }: {
	imports = [
		./hardware-configuration.nix
		./disks.nix
		./services.nix
		./user.nix
		./pkgs.nix
	];

	# for dark theme
	programs.dconf.enable = true;

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

#  boot.kernelParams = [
#    "nohz_idle=on"
#    "processor.ignore_ppc=1"
#    "acpi_cpufreq.enable_pcc=false"
#    "amd_pstate=disable"
#  ];

}
