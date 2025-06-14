-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "rose-pine/neovim", as = "rose-pine" })
	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("mbbill/undotree")
	use("tpope/vim-fugitive")

	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})

	-- Required plugins
	use("nvim-treesitter/nvim-treesitter")
	use("stevearc/dressing.nvim")
	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")
	use("MeanderingProgrammer/render-markdown.nvim")

	-- Optional dependencies
	use("hrsh7th/nvim-cmp")
	use("nvim-tree/nvim-web-devicons") -- or use 'echasnovski/mini.icons'
	use("HakonHarnes/img-clip.nvim")
	use("zbirenbaum/copilot.lua")

	-- Avante.nvim with build process
	use({
		"yetone/avante.nvim",
		branch = "main",
		run = "make",
		config = function()
			require("avante").setup()
		end,
	})
	use({
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup()
		end,
	})
	use({
		"rmagatti/alternate-toggler",
		config = function()
			require("alternate-toggler").setup({
				alternates = {
					["=="] = "!=",
				},
			})

			vim.keymap.set(
				"n",
				"<leader><space>", -- <space><space>
				"<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
			)
		end,
		event = { "BufReadPost" }, -- lazy load after reading a buffer
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional
		},
	})
	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})
	use({ "mfussenegger/nvim-lint" })
	use({ "Exafunction/windsurf.vim" })
	use({
		"folke/noice.nvim",
		event = "VimEnter",
		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				views = {
					notify = {},
					mini = {},
					cmdline = {},
					messages = {},
					confirm = {},
					hover = {},
					popupmenu = {},
					cmdline_output = {},
					cmdline_popup = {},
					popup = {
						position = {
							row = 0, -- Top of the screen
							col = "100%",
						},
					},
				},
			})
		end,
		requires = {
			{ "MunifTanjim/nui.nvim" },
			{ "rcarriga/nvim-notify", opt = true },
		},
	})
end)
