# /nix/hosts/x13/sandbox.nix
{ username, ... }:
{
	# docker
	#virtualisation.docker.enable = true;

	# qemu
	#virtualisation.libvirtd.enable = true;

	# Virtual Box
	virtualisation.virtualbox.host.enable = true;
	users.extraGroups.vboxusers.members = [ "${username}" ];
	virtualisation.virtualbox.host.enableExtensionPack = true;
}
