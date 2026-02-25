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

-- Fold settings
vim.opt.fillchars = { fold = " " }
vim.opt.foldmethod = "indent"
vim.opt.foldenable = false
vim.opt.foldlevel = 99
vim.g.markdown_folding = 1

-- Disable comments on new line
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Statusline
vim.opt.laststatus = 3
vim.opt.statusline = " %f %M %= %l:%c %p%% ♥ "

-- Tabline
function _G.simple_tabline()
	local s = ""

	for i = 1, vim.fn.tabpagenr("$") do
		local winnr = vim.fn.tabpagewinnr(i)
		local buflist = vim.fn.tabpagebuflist(i)
		local bufnr = buflist[winnr]
		local name = vim.fn.bufname(bufnr)
		local filename = name ~= "" and vim.fn.fnamemodify(name, ":t") or "[No Name]"

		if i == vim.fn.tabpagenr() then
			s = s .. "%#TabLineSel#"
		else
			s = s .. "%#TabLine#"
		end

		s = s .. " " .. i .. ": " .. filename .. " "
	end

	s = s .. "%#TabLineFill#%T"
	return s
end

vim.o.tabline = "%!v:lua.simple_tabline()"
vim.o.showtabline = 1


-- Command line

vim.o.cmdheight = 0
