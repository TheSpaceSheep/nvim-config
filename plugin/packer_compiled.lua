-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/noe/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/noe/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/noe/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/noe/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/noe/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alternate-toggler"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\f\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0B\0\4\1K\0\1\0@<cmd>lua require('alternate-toggler').toggleAlternate()<CR>\20<leader><space>\6n\bset\vkeymap\bvim\15alternates\1\0\1\15alternates\0\1\0\1\a==\a!=\nsetup\22alternate-toggler\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/noe/.local/share/nvim/site/pack/packer/opt/alternate-toggler",
    url = "https://github.com/rmagatti/alternate-toggler"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["codecompanion.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\6\0\v\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\b\0005\5\a\0=\5\t\4=\4\n\3D\0\3\0\vschema\nmodel\1\0\1\nmodel\0\1\0\1\fdefault*google/gemini-2.5-flash-preview-05-20\benv\1\0\2\vschema\0\benv\0\1\0\3\rchat_url\25/v1/chat/completions\burl\30https://openrouter.ai/api\fapi_key\23OPENROUTER_API_KEY\22openai_compatible\vextend\27codecompanion.adapters\frequire�\1\1\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0003\4\n\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\radapters\15openrouter\1\0\1\15openrouter\0\0\15strategies\1\0\2\15strategies\0\radapters\0\vinline\1\0\1\fadapter\15openrouter\tchat\1\0\2\vinline\0\tchat\0\1\0\1\fadapter\15openrouter\nsetup\18codecompanion\frequire\0" },
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/codecompanion.nvim",
    url = "https://github.com/olimorris/codecompanion.nvim"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["dressing.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["img-clip.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/img-clip.nvim",
    url = "https://github.com/HakonHarnes/img-clip.nvim"
  },
  ["lsp-zero.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/lsp-zero.nvim",
    url = "https://github.com/VonHeikemen/lsp-zero.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n�\5\0\0\6\0\25\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0004\4\0\0=\4\v\0034\4\0\0=\4\f\0034\4\0\0=\4\r\0034\4\0\0=\4\14\0034\4\0\0=\4\15\0034\4\0\0=\4\16\0034\4\0\0=\4\17\0034\4\0\0=\4\18\0034\4\0\0=\4\19\0035\4\21\0005\5\20\0=\5\22\4=\4\23\3=\3\24\2B\0\2\1K\0\1\0\nviews\npopup\rposition\1\0\1\rposition\0\1\0\2\brow\3\0\bcol\t100%\18cmdline_popup\19cmdline_output\14popupmenu\nhover\fconfirm\rmessages\fcmdline\tmini\vnotify\1\0\n\fcmdline\0\npopup\0\18cmdline_popup\0\19cmdline_output\0\14popupmenu\0\nhover\0\fconfirm\0\rmessages\0\vnotify\0\tmini\0\fpresets\1\0\5\18bottom_search\2\19lsp_doc_border\1\15inc_rename\1\26long_message_to_split\2\20command_palette\2\blsp\1\0\3\nviews\0\fpresets\0\blsp\0\roverride\1\0\1\roverride\0\1\0\0031vim.lsp.util.convert_input_to_markdown_lines\2 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\2\nsetup\nnoice\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/noe/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lint"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/noe/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["render-markdown.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/render-markdown.nvim",
    url = "https://github.com/MeanderingProgrammer/render-markdown.nvim"
  },
  ["rose-pine"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/rose-pine",
    url = "https://github.com/rose-pine/neovim"
  },
  ["supermaven-nvim"] = {
    config = { "\27LJ\2\n\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0�\2\1\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\14condition\0\ncolor\1\0\2\ncterm\3�\1\21suggestion_color\f#ffffff\21ignore_filetypes\1\0\1\bcpp\2\fkeymaps\1\0\a\20disable_keymaps\1\fkeymaps\0\ncolor\0\14condition\0\21ignore_filetypes\0\30disable_inline_completion\1\14log_level\tinfo\1\0\3\22accept_suggestion\18<leader><Tab>\16accept_word\14<leader>l\21clear_suggestion\14<leader>j\nsetup\20supermaven-nvim\frequire\0" },
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/supermaven-nvim",
    url = "https://github.com/supermaven-inc/supermaven-nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["windsurf.nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\0035\4\6\0=\4\a\3=\3\b\2B\0\2\1K\0\1\0\17virtual_text\17key_bindings\1\0\6\16accept_line\1\16accept_word\1\vaccept\n<Tab>\tnext\n<M-]>\tprev\n<M-[>\nclear\1\14filetypes\1\0\t\14filetypes\0\vmanual\2\fenabled\1\17key_bindings\0\20accept_fallback\0\rmap_keys\2\26virtual_text_priority\3��\3\15idle_delay\3K\29default_filetype_enabled\2\1\0\2\22enable_cmp_source\1\17virtual_text\0\nsetup\fcodeium\frequire\0" },
    loaded = true,
    path = "/home/noe/.local/share/nvim/site/pack/packer/start/windsurf.nvim",
    url = "https://github.com/Exafunction/windsurf.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: codecompanion.nvim
time([[Config for codecompanion.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\6\0\v\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\b\0005\5\a\0=\5\t\4=\4\n\3D\0\3\0\vschema\nmodel\1\0\1\nmodel\0\1\0\1\fdefault*google/gemini-2.5-flash-preview-05-20\benv\1\0\2\vschema\0\benv\0\1\0\3\rchat_url\25/v1/chat/completions\burl\30https://openrouter.ai/api\fapi_key\23OPENROUTER_API_KEY\22openai_compatible\vextend\27codecompanion.adapters\frequire�\1\1\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\0025\3\v\0003\4\n\0=\4\f\3=\3\r\2B\0\2\1K\0\1\0\radapters\15openrouter\1\0\1\15openrouter\0\0\15strategies\1\0\2\15strategies\0\radapters\0\vinline\1\0\1\fadapter\15openrouter\tchat\1\0\2\vinline\0\tchat\0\1\0\1\fadapter\15openrouter\nsetup\18codecompanion\frequire\0", "config", "codecompanion.nvim")
time([[Config for codecompanion.nvim]], false)
-- Config for: windsurf.nvim
time([[Config for windsurf.nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\5\0\t\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0004\4\0\0=\4\5\0035\4\6\0=\4\a\3=\3\b\2B\0\2\1K\0\1\0\17virtual_text\17key_bindings\1\0\6\16accept_line\1\16accept_word\1\vaccept\n<Tab>\tnext\n<M-]>\tprev\n<M-[>\nclear\1\14filetypes\1\0\t\14filetypes\0\vmanual\2\fenabled\1\17key_bindings\0\20accept_fallback\0\rmap_keys\2\26virtual_text_priority\3��\3\15idle_delay\3K\29default_filetype_enabled\2\1\0\2\22enable_cmp_source\1\17virtual_text\0\nsetup\fcodeium\frequire\0", "config", "windsurf.nvim")
time([[Config for windsurf.nvim]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: supermaven-nvim
time([[Config for supermaven-nvim]], true)
try_loadstring("\27LJ\2\n\15\0\0\1\0\0\0\2+\0\1\0L\0\2\0�\2\1\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\14condition\0\ncolor\1\0\2\ncterm\3�\1\21suggestion_color\f#ffffff\21ignore_filetypes\1\0\1\bcpp\2\fkeymaps\1\0\a\20disable_keymaps\1\fkeymaps\0\ncolor\0\14condition\0\21ignore_filetypes\0\30disable_inline_completion\1\14log_level\tinfo\1\0\3\22accept_suggestion\18<leader><Tab>\16accept_word\14<leader>l\21clear_suggestion\14<leader>j\nsetup\20supermaven-nvim\frequire\0", "config", "supermaven-nvim")
time([[Config for supermaven-nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'alternate-toggler'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'noice.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
