return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.files").setup( -- No need to copy this inside `setup()`. Will be used automatically.
			{
				-- Customization of shown content
				content = {
					-- Predicate for which file system entries to show
					filter = nil,
					-- What prefix to show to the left of file system entry
					prefix = nil,
					-- In which order to show file system entries
					sort = nil,
				},

				-- Module mappings created only inside explorer.
				-- Use `''` (empty string) to not create one.
				mappings = {
					close = "q",
					go_in = "l",
					go_in_plus = "L",
					go_out = "h",
					go_out_plus = "H",
					mark_goto = "'",
					mark_set = "m",
					reset = "<BS>",
					reveal_cwd = "@",
					show_help = "g?",
					synchronize = "=",
					trim_left = "<",
					trim_right = ">",
				},

				-- General options
				options = {
					-- Whether to delete permanently or move into module-specific trash
					permanent_delete = true,
					-- Whether to use for editing directories
					use_as_default_explorer = true,
				},

				-- Customization of explorer windows
				windows = {
					-- Maximum number of windows to show side by side
					max_number = math.huge,
					-- Whether to show preview of file/directory under cursor
					preview = false,
					-- Width of focused window
					width_focus = 50,
					-- Width of non-focused window
					width_nofocus = 15,
					-- Width of preview window
					width_preview = 25,
				},
			}
		)
		require("mini.ai").setup()
		require("mini.surround").setup({
			-- Add custom surroundings to be used on top of builtin ones. For more
			-- information with examples, see `:h MiniSurround.config`.
			custom_surroundings = nil,

			-- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
			highlight_duration = 500,

			-- Module mappings. Use `''` (empty string) to disable one.
			mappings = {
				add = "<leader>csa", -- Add surrounding in Normal and Visual modes
				delete = "<leader>csd", -- Delete surrounding
				find = "<leader>csf", -- Find surrounding (to the right)
				find_left = "<leader>csF", -- Find surrounding (to the left)
				highlight = "<leader>csh", -- Highlight surrounding
				replace = "<leader>csr", -- Replace surrounding
				update_n_lines = "<leader>csn", -- Update `n_lines`

				suffix_last = "N", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},

			-- Number of lines within which surrounding is searched
			n_lines = 20,

			-- Whether to respect selection type:
			-- - Place surroundings on separate lines in linewise mode.
			-- - Place surroundings on each line in blockwise mode.
			respect_selection_type = false,

			-- How to search for surrounding (first inside current line, then inside
			-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
			-- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
			-- see `:h MiniSurround.config`.
			search_method = "cover",

			-- Whether to disable showing non-error feedback
			-- This also affects (purely informational) helper messages shown after
			-- idle time if user input is required.
			silent = false,
		})
	end,
}
