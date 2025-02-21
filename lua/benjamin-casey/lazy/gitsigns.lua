return {
	"lewis6991/gitsigns.nvim",
  lazy = false,
	opts = {},
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Toggles
				-- map("n", "<leader>gB", gitsigns.toggle_current_line_blame)
				map("n", "<leader>gd", gitsigns.diffthis)
			end,
		})
	end,
  keys = {
    { "<leader>gb", "<cmd>Gitsigns blame_line<CR>", desc="Git signs line blame"},
    { "<leader>gB", "<cmd>Gitsigns blame<CR>", desc="Git signs buffer blame"},
    { "<leader>gp", "<cmd>Gitsigns preview_hunk_inline<CR>", desc="Git signs preview hunk inline"},
    { "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", desc="Git signs reset hunk"},
    { "<leader>gc", "<cmd>Gitsigns select_hunk<CR>", desc="Git signs select hunk"},
  }
}
