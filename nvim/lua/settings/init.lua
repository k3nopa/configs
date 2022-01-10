local opt = vim.opt

opt.errorbells = false
opt.relativenumber = true
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.autoindent = true
opt.wrap = false
opt.hlsearch = true
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true
opt.scrolloff = 5
opt.mouse = 'a'
opt.termguicolors = true
opt.splitright = true
opt.splitbelow = true
opt.cursorline = true
opt.hidden = true

opt.completeopt = 'menuone,noinsert,noselect'   -- For Autocompletion.
opt.updatetime = 300                            -- For Autocompletion.
opt.shortmess = opt.shortmess + 'c'

-- Keybindings
local keymap = vim.api.nvim_set_keymap
local keymap_opts = { noremap = true, silent = true }

vim.g.mapleader = ',' 
    -- Split Navigation.
keymap('n', '<c-j>', '<c-w>j', keymap_opts)
keymap('n', '<c-h>', '<c-w>h', keymap_opts)
keymap('n', '<c-k>', '<c-w>k', keymap_opts)
keymap('n', '<c-l>', '<c-w>l', keymap_opts)
    -- Nvim Tree
keymap('n', '<leader>e', ':NvimTreeToggle<CR>', keymap_opts)
    -- Telescope
keymap('n', 'ff', ':Telescope find_files<CR>', keymap_opts)
keymap('n', 'fg', ':Telescope live_grep<CR>', keymap_opts)

-- Plugins Settings.
require('settings.autocmp')
require('settings.language-server')
require('settings.treesitter-conf')

require'nvim-tree'.setup {
    auto_close = true,
    diagnostics = {
        enable = true,
    },
}

vim.api.nvim_command([[ autocmd CursorHold * lua vim.diagnostic.open_float() ]])
