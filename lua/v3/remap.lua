vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- format file (make pretty)
vim.keymap.set("n", "<leader>mp", function() vim.lsp.buf.format() end, { desc = "Format buffer" })

-- Move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep search terms in centre of screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over selection without copying
vim.keymap.set("x", "<leader>p", '"_dP')

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- We don't want to press Q?
vim.keymap.set("n", "Q", "<nop>")

-- Delete to void register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v<C-w>w", { desc = "Split window vertically" })   -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s<C-w>w", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })          -- make split windows equal width & height
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" })     -- close current split window
vim.keymap.set("n", "<leader>so", "<C-w>o", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>sn", "<C-w>w", { desc = "Go to next window" })
vim.keymap.set("n", "<leader>sN", "<C-w>W", { desc = "Go to previous window" })
vim.keymap.set("n", "<leader>sp", "<cmd>bp<cr>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>sP", "<cmd>bn<cr>", { desc = "Go to next buffer" })

-- tab management
vim.keymap.set("n", "<leader>T", "<cmd>tabnew<CR>", { desc = "Create new tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })              -- close current tab
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Closes all other tabs" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })                     --  go to next tab
vim.keymap.set("n", "<leader>tN", "<cmd>tabp<CR>", { desc = "Go to previous tab" })                 --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Move current buffer to new tab" }) --  move current buffer to new tab


-- No highlight
vim.keymap.set("n", "<leader>nh", "<cmd>noh<cr>", { desc = "No highlight" })
vim.keymap.set("v", "<leader>nh", "<cmd>noh<cr>", { desc = "No highlight" })

-- Code action
vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, { desc = "Show LSP code actions" })

--toggle relative vs absolute line numbers
vim.keymap.set("n", "<leader>nn", function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  else
    vim.wo.relativenumber = true
  end
end)

-- Useless -> Ceullar automaton animation
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>mg", "<cmd>CellularAutomaton game_of_life<CR>")
