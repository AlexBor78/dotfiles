# /nix/home/nixvim.nix
{ nixvim, ... }: {

  imports = [
    nixvim.homeModules.nixvim
  ];

  # nixvim
  programs.nixvim = {
    enable = true;
    
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
			background = "dark";

			clipboard = {
			  register = "unnamedplus";
			  providers.wl-copy.enable = true; # for Wayland
			};
    };
	
		# theme
		colorschemes.tokyonight = {
	    enable = true;
	    settings.style = "night";
	    settings.transparent = true;
	  };
		
		plugins = {
			nioce.enable = true;
			lualine.enable = true;
			web-devicons.enable = true;
			telescope.enable = true;
			oil.enable = true;
		  which-key.enable = true;
			gitsigns.enable = true;
			lazygit.enable = true;

			luasnip.enable = true;
			cmp = {
				enalbe = true;
				settins.source = [
					{ name = "nvim_lsp"; }
					{ name = "path"; }
					{ name = "buffer"; }
				];
			};

			lsp = {
				enable = true;
				servers = {
			    nil_ls.enable = true;
			    clangd.enable = true;
					cmake.enable = true;
			    bashls.enable = true;
					jsonls.enable = true;
			  };
			};
		};
  };
}
