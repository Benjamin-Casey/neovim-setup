local opt = vim.opt
opt.guicursor = "i:block"                          -- Use block cursor in insert mode
opt.colorcolumn = "80"                             -- Highlight column 80
opt.signcolumn = "yes:1"                           -- Always show sign column
opt.termguicolors = true                           -- Enable true colors
opt.ignorecase = true                              -- Ignore case in search
opt.smartcase = true                               -- Don't ignore case if used in search
opt.swapfile = false                               -- Disable swap files
opt.autoindent = true                              -- Enable auto indentation
opt.expandtab = true                               -- Use spaces instead of tabs
opt.tabstop = 4                                    -- Number of spaces for a tab
opt.softtabstop = 2                                -- Number of spaces for a tab when editing
opt.shiftwidth = 2                                 -- Number of spaces for autoindent
opt.shiftround = true                              -- Round indent to multiple of shiftwidth
opt.number = true                                  -- Show line numbers
opt.relativenumber = true                          -- Show relative line numbers
opt.numberwidth = 2                                -- Width of the line number column
opt.wrap = false                                   -- Disable line wrapping
opt.cursorline = true                              -- Highlight the current line
opt.scrolloff = 8                                  -- Keep 8 lines above and below the cursor
opt.inccommand = "nosplit"                         -- Shows the effects of a command incrementally in the buffer
opt.undodir = os.getenv('HOME') .. '/.vim/undodir' -- Directory for undo files
opt.undofile = true                                -- Enable persistent undo
vim.opt.updatetime = 50                            -- Updates statusline etc
vim.opt.showmode = false                           -- Hide mode

-- Fold settings
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.g.markdown_folding = 1

-- Disable comments on new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation
