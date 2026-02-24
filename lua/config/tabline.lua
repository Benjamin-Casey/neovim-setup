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

