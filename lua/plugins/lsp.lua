return {
	"mason-org/mason-lspconfig.nvim",
	opts = {},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{ "neovim/nvim-lspconfig" },
		{ "j-hui/fidget.nvim", opts = {} },
	},
	config = function()
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		vim.lsp.config("pylsp", {
			settings = {
				pylsp = {
					plugins = {
						pycodestyle = {
							-- ignore = { 'W391' },
							maxLineLength = 88,
						},
					},
				},
			},
		})
		require("mason-lspconfig").setup()
	end,
}
