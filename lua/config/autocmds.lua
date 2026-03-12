-- Restore cursor to file position in previous editing session
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.cmd('normal! g`"zz')
		end
	end,
})

-- removes trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local save_cursor = vim.fn.getpos(".")
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.setpos(".", save_cursor)
	end,
})

-- highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "WinScrolled" }, {
	desc = "Fix scrolloff when you are at the EOF",
	group = vim.api.nvim_create_augroup("ScrollEOF", { clear = true }),
	callback = function()
		if vim.api.nvim_win_get_config(0).relative ~= "" then
			return -- Ignore floating windows
		end

		local win_height = vim.fn.winheight(0)
		local scrolloff = math.min(vim.o.scrolloff, math.floor(win_height / 2))
		local visual_distance_to_eof = win_height - vim.fn.winline()

		if visual_distance_to_eof < scrolloff then
			local win_view = vim.fn.winsaveview()
			vim.fn.winrestview({ topline = win_view.topline + scrolloff - visual_distance_to_eof })
		end
	end,
})

-- Automatically Split help Buffers to the right
vim.api.nvim_create_autocmd("FileType", {
	desc = "Automatically Split help Buffers to the right",
	pattern = "help",
	command = "wincmd L",
})

-- Hide notification when saving a file
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("gmr_hide_message_after_write", { clear = true }),
	desc = "Get rid of message after writing a file",
	pattern = { "*" },
	command = "redrawstatus",
})
