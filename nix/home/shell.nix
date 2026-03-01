# /nix/home/shell.nix

{ config, pkgs, lib, theme, hostname, ... } : {
	programs.bat.enable = true;
	programs.lsd.enable = true;

	programs.zsh = {
		enable = true;
		enableCompletion = true;
 	  autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

		initContent = '' 
			eval "$(starship init zsh)"
			fastfetch
		'';

		oh-my-zsh = {
			enable = true;
			theme = "";
			plugins = [
				"git"
#				"zsh-autosuggestions"
#				"zsh-syntax-highlighting"

			];
		};

		shellAliases = {
			ls = lib.mkForce "lsd";
			cat = "bat";
			rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#${hostname}";

		};
	};

	programs.starship = {
		enable = true;
		settings = {
			format = "$username@$hostname $directory $git_branch $battery\n$character";
			add_newline = false;

		  username = {
				show_always = true;
				format = "[$user]($style)";
				style_user = "purple";
			};

		  hostname = {
				disabled = false;
				ssh_only = false;
				format = "[$hostname]($style)";
				style = "dimmed purple";
			};

		  directory = {
				disabled = false;
				format = "[$path]($style)";
				style = "bold blue";
				truncation_length = 0;
				truncate_to_repo = false;
			};

			git_branch = {
				symbol = "";
				format = "[\\($branch\\)]($style)";
				style = "bold purple";
			};
			time.disabled = true;

		  battery = {
				disabled = false;
				display = [ 
					{
						threshold = 5;
						style = "bold red";
					}
					{
						threshold = 30;
						style = "bold yellow";
					}
					{
						threshold = 100;
						style = "bold green";
					}
				];
				format = "[$percentage]($style)";
				full_symbol = "";
				charging_symbol = "";
				discharging_symbol = "";
			};
			character = {
				success_symbol = "[>\\$](bold purple)";
		    error_symbol = "[>\\$](bold red)";
			};
		};
	};
}
