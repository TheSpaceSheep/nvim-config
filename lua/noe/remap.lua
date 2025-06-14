vim.g.mapleader = ","
vim.api.nvim_set_keymap("n", "<leader>;", "<Esc>", { noremap = true, silent = true }) -- Insert mode
vim.api.nvim_set_keymap("i", "<leader>;", "<Esc>", { noremap = true, silent = true }) -- Insert mode
vim.api.nvim_set_keymap("v", "<leader>;", "<Esc>", { noremap = true, silent = true }) -- Visual mode
vim.api.nvim_set_keymap("c", "<leader>;", "<C-c>", { noremap = true, silent = true }) -- Command-line mode
vim.api.nvim_set_keymap("t", "<leader>;", "<C-\\><C-N>", { noremap = true, silent = true }) -- Terminal mode
vim.api.nvim_set_keymap("x", "<leader>;", "<Esc>", { noremap = true, silent = true }) -- Ex mode
vim.api.nvim_set_keymap("o", "<leader>;", "<C-\\><C-N>", { noremap = true, silent = true }) -- Open mode
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>>>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>r", function()
	vim.cmd("write") -- Save the file
	local filepath = vim.fn.expand("%:p") -- Get the full path of the current file
	vim.fn.setreg("n", filepath) -- Set the "n" register with the file path

	-- Open a new tab with a terminal
	vim.cmd("tabnew | terminal")

	-- Get the current terminal buffer ID
	local term_buf = vim.api.nvim_get_current_buf()

	-- Send commands to the terminal
	local commands = {
		"source *env*/bin/activate", -- Activate the virtual environment
		"python " .. filepath, -- Run the Python file
	}

	for _, cmd in ipairs(commands) do
		vim.fn.chansend(vim.b.terminal_job_id, cmd .. "\n")
	end
end)

vim.keymap.set("n", "<C-j>", "<C-W><C-J>")
vim.keymap.set("n", "<C-k>", "<C-W><C-K>")
vim.keymap.set("n", "<C-l>", "<C-W><C-L>")
vim.keymap.set("n", "<C-h>", "<C-W><C-H>")
vim.keymap.set("n", "gt", ":tab split<CR>")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("n", "<leader>h", ":noh<CR>")

vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

vim.keymap.set("i", "æ", "0")
vim.keymap.set("i", "«", "1")
vim.keymap.set("i", "€", "2")
vim.keymap.set("i", "¶", "3")
vim.keymap.set("i", "ŧ", "4")
vim.keymap.set("i", "←", "5")
vim.keymap.set("i", "↓", "6")
vim.keymap.set("i", "→", "7")
vim.keymap.set("i", "ø", "8")
vim.keymap.set("i", "þ", "9")

vim.keymap.set("n", "<leader><Tab>", ":NvimTreeToggle<CR>")

vim.keymap.set("i", "<leader>m", function()
	return vim.fn["codeium#CycleOrComplete"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<leader><Tab>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, silent = true })
vim.keymap.set("i", "<leader>M", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, silent = true })
