vim.g.mapleader = " "

require("config.options")
require("config.keymaps")
require("config.lazy")

require("config.statusline")
require("config.tabline")

vim.cmd("colorscheme rose-pine")
