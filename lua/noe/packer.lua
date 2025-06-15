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
	use("stevearc/dressing.nvim")
	use("nvim-lua/plenary.nvim")
	use("MunifTanjim/nui.nvim")
	use("MeanderingProgrammer/render-markdown.nvim")

	-- Optional dependencies
	use("nvim-tree/nvim-web-devicons") -- or use 'echasnovski/mini.icons'
	use("HakonHarnes/img-clip.nvim")

	-- use({
	-- 	"supermaven-inc/supermaven-nvim",
	-- 	config = function()
	-- 		require("supermaven-nvim").setup({
	-- 			keymaps = {
	-- 				accept_suggestion = "<Tab>",
	-- 				clear_suggestion = "<C-]>",
	-- 				accept_word = "<C-j>",
	-- 			},
	-- 			ignore_filetypes = { cpp = true }, -- or { "cpp", }
	-- 			color = {
	-- 				suggestion_color = "#ffffff",
	-- 				cterm = 244,
	-- 			},
	-- 			log_level = "info", -- set to "off" to disable logging completely
	-- 			disable_inline_completion = false, -- disables inline completion for use with cmp
	-- 			disable_keymaps = false, -- disables built in keymaps for more manual control
	-- 			condition = function()
	-- 				return true
	-- 			end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
	-- 		})
	-- 	end,
	-- })
	use({
		"Exafunction/windsurf.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({
				enable_cmp_source = false,
				virtual_text = {
					enabled = false,

					-- These are the defaults

					-- Set to true if you never want completions to be shown automatically.
					manual = true,
					-- A mapping of filetype to true or false, to enable virtual text.
					filetypes = {},
					-- Whether to enable virtual text of not for filetypes not specifically listed above.
					default_filetype_enabled = true,
					-- How long to wait (in ms) before requesting completions after typing stops.
					idle_delay = 75,
					-- Priority of the virtual text. This usually ensures that the completions appear on top of
					-- other plugins that also add virtual text, such as LSP inlay hints, but can be modified if
					-- desired.
					virtual_text_priority = 65535,
					-- Set to false to disable all key bindings for managing completions.
					map_keys = true,
					-- The key to press when hitting the accept keybinding but no completion is showing.
					-- Defaults to \t normally or <c-n> when a popup is showing.
					accept_fallback = nil,
					-- Key bindings for managing completions in virtual text mode.
					key_bindings = {
						-- Accept the current completion.
						accept = "<Tab>",
						-- Accept the next word.
						accept_word = false,
						-- Accept the next line.
						accept_line = false,
						-- Clear the virtual text.
						clear = false,
						-- Cycle to the next completion.
						next = "<M-]>",
						-- Cycle to the previous completion.
						prev = "<M-[>",
					},
				},
			})
		end,
	})

	-- Avante.nvim with build process
	-- use({
	-- 	"yetone/avante.nvim",
	-- 	branch = "main",
	-- 	run = "make",
	-- 	config = function()
	-- 		require("avante").setup()
	-- 	end,
	-- })
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
	use({
		"olimorris/codecompanion.nvim",
		config = function()
			require("codecompanion").setup({
				strategies = {
					chat = {
						adapter = "openrouter",
					},
					inline = {
						adapter = "openrouter",
					},
				},
				adapters = {
					openrouter = function()
						return require("codecompanion.adapters").extend("openai_compatible", {
							env = {
								url = "https://openrouter.ai/api",
								api_key = "OPENROUTER_API_KEY",
								chat_url = "/v1/chat/completions",
							},
							schema = {
								model = {
									default = "google/gemini-2.5-flash-preview-05-20",
								},
							},
						})
					end,
				},
			})
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	})
	use({
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup({
				keymaps = {
					accept_suggestion = "<leader><Tab>",
					clear_suggestion = "<leader>j",
					accept_word = "<leader>l",
				},
				ignore_filetypes = { cpp = true }, -- or { "cpp", }
				color = {
					suggestion_color = "#ffffff",
					cterm = 244,
				},
				log_level = "info", -- set to "off" to disable logging completely
				disable_inline_completion = false, -- disables inline completion for use with cmp
				disable_keymaps = false, -- disables built in keymaps for more manual control
				condition = function()
					return false
				end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
			})
		end,
	})
end)
