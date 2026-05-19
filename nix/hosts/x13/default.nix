# /nix/hosts/x13/default.nix

{ ... }: {
	imports = [
		./hardware-configuration.nix
		./disks.nix
		./services.nix
		./user.nix
		./pkgs.nix
	];

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

  boot.kernelParams = [
		# enable amd_pstate
    "nohz_idle=on"
    "processor.ignore_ppc=1"
    "acpi_cpufreq.enable_pcc=false"
    "amd_pstate=disable"
  ];

}
