vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- JavaScript and TypeScript specific settings with 2-space indentation
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "html", "css", "yaml", "vue" },
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
	end,
})

vim.g.codeium_manual = false

-- Treesitter-based folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 0 -- Open all folds by default

-- Optional: Use indent-based folding for Python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.foldmethod = "indent"
		vim.opt_local.foldexpr = ""
	end,
})
