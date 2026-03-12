vim.g.mapleader = " "

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("statusline")
require("config.lazy")

vim.cmd("colorscheme rose-pine")
