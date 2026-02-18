vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "88"

-- Mode doesn't need to be shown due to lualine
vim.opt.showmode = false

-- Change linenumber color
vim.o.cursorline = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Persistent undo history
vim.opt.undofile = true

vim.o.swapfile = false
vim.opt.clipboard = "unnamed"

-- Disable comments on new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
