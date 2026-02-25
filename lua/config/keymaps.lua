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

-- Delete to void register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- We don't want to press Q?
vim.keymap.set("n", "Q", "<nop>")

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v<C-w>w", { desc = "Split window vertically" })
vim.keymap.set("n", "<leader>sh", "<C-w>s<C-w>w", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
vim.keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" })
vim.keymap.set("n", "<leader>so", "<C-w>o", { desc = "Close all other windows" })
vim.keymap.set("n", "<leader>sn", "<C-w>w", { desc = "Go to next window" })
vim.keymap.set("n", "<leader>sN", "<C-w>W", { desc = "Go to previous window" })
vim.keymap.set("n", "<leader>sp", "<cmd>bp<cr>", { desc = "Go to previous buffer" })
vim.keymap.set("n", "<leader>sP", "<cmd>bn<cr>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<leader>sr", "<C-w>L", { desc = "Rotate window" })

vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to above window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to left window" })
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to below window" })

-- tab management
vim.keymap.set("n", "<leader>T", "<cmd>tabnew<CR>", { desc = "Create new tab" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<CR>", { desc = "Closes all other tabs" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tN", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Move current buffer to new tab" })

-- QF List nav
vim.keymap.set("n", "]q", "<cmd>cnext<CR>", { desc = "Go to next quickfix item" })
vim.keymap.set("n", "[q", "<cmd>cprevious<CR>", { desc = "Go to previous quickfix item" })

-- No highlight
vim.keymap.set("n", "<leader>nh", "<cmd>noh<cr>", { desc = "No highlight" })
vim.keymap.set("v", "<leader>nh", "<cmd>noh<cr>", { desc = "No highlight" })

--- LSP
vim.keymap.set("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Show LSP code actions" })

vim.keymap.set("n", "gD", function()
	if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
		vim.lsp.buf.definition()
	else
		vim.cmd("normal! gd")
	end
end, { noremap = true, silent = true, desc = "Go to LSP definition" })

vim.keymap.set("n", "gt", function()
	if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
		vim.lsp.buf.type_definition()
	else
		vim.notify("No attached LSP!")
	end
end, { noremap = true, silent = true, desc = "Go to LSP type definition" })

vim.keymap.set("n", "gR", function()
	if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
		vim.lsp.buf.references()
	else
		vim.notify("No attached LSP!")
	end
end, { noremap = true, silent = true, desc = "Go to LSP references" })

vim.keymap.set("n", "K", function()
	if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
		vim.lsp.buf.hover()
	else
		vim.cmd("normal! K")
	end
end, { noremap = true, silent = true, desc = "LSP hover" })

vim.keymap.set("n", "<C-K>", function()
	if next(vim.lsp.get_clients({ bufnr = 0 })) ~= nil then
		vim.lsp.buf.signature_help()
	else
		vim.cmd("normal! K")
	end
end, { noremap = true, silent = true, desc = "LSP signature_help" })

--toggle relative vs absolute line numbers
vim.keymap.set("n", "<leader>nn", function()
	if vim.wo.relativenumber then
		vim.wo.relativenumber = false
		vim.wo.number = true
	else
		vim.wo.relativenumber = true
	end
end)

-- Toggle LSP diagnostics
vim.keymap.set("n", "<leader>dt", function()
	if vim.diagnostic.is_enabled() then
		vim.diagnostic.enable(false)
	else
		vim.diagnostic.enable(true)
	end
end)
