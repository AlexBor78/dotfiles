# /nix/home/shell.nix

{ config, pkgs, lib, theme, hostname, dotsroot, ... } : {

	programs.bat = {
		enable = true;
		tokyonight.enable = true;
	};

	home.packages = with pkgs; [
			gh
			lsd
			bat
			kitty
			lazygit
			starship
			fastfetch
	];

	# todo: btop theme doesn't work
	programs.btop.settings.color_theme = "tokyo-night";

	# kitty
	programs.kitty = {
	  enable = true;
		# theme
	  extraConfig = builtins.readFile ( pkgs.fetchFromGitHub {
	      owner = "folke";
	      repo = "tokyonight.nvim";
	      rev = "main";
	      sha256 = "sha256-a9iRWue7DB7s/wNdxqqB51Jya5P9X6sDftqhdmKggU0=";
	      #sha256 = "sha256-4zfkv3egdWJ/GCWUehV0MAIXxsrGT82Wd1Qqj1SCGOk=";
	    } + "/extras/kitty/tokyonight_night.conf"
	  );
	};

	# zsh - shell
	programs.zsh = {
		enable = true;
		enableCompletion = true;
 	  autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

		initContent = '' 
			if [ -z "$SSH_AUTH_SOCK" ]; then
			  eval "$(ssh-agent -s)"
			fi
			eval "$(starship init zsh)"
			fastfetch
		'';

		oh-my-zsh = {
			enable = true;
			theme = "";
			plugins = [
				"git"
			];
		};

		shellAliases = {
			ls = lib.mkForce "lsd";
			cat = "bat";
			rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#${hostname}";
			upate = "sudo nix flake update";
		};
	};

	programs.starship = {
		enable = true;
		settings = {
			format = "$username@$hostname $directory $git_branch $battery\n$character";
			add_newline = false;

			time.disabled = true;
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

		  battery = {
				disabled = false;
				full_symbol = "";
				charging_symbol = "";
				discharging_symbol = "";
				format = "[$percentage]($style)";
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
			};

			character = {
				success_symbol = "[>\\$](bold purple)";
		    error_symbol = "[>\\$](bold red)";
			};
		};
	};

	# fastfetch 
	programs.fastfetch = {
		enable = true;
		settings = {
			logo = {
				type = "kitty";
				source = "${dotsroot}/assets/nixos-logo.png";
				width = 40;
				height = 20;
				padding = {
					top = 0;
					right = 0;
					left = 2;
				};
			};

			modules = let mkModules = list: map (item:
					if builtins.isString item then {
						type = item;
						key = lib.toLower item;
						keyColor = "blue";
					}	else {
						type = item.type;
						key = lib.toLower item.type;
						format = item.format;
						keyColor = "blue";
					}) list; 	
			in [ "title" "separator" ]
			++					mkModules [ "host" 
										{ type = "cpu"; format = "{name} ({cores-physical}/{cores-logical}) @ {freq-max}"; }
										"gpu" "memory" "swap" "disk" "battery" "uptime" ]
			++ 					[ "separator" ]
			++ 					mkModules [ "Kernel" "os" "terminal" "wm" "shell" "packages" ]
			++					[ "separator" {type = "colors";} ];
		};
	};
}
