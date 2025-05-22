return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"j-hui/fidget.nvim",
		"stevearc/conform.nvim",
		"saghen/blink.cmp",
	},

	config = function()
		require("conform").setup()

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"ts_ls",
			},
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup({
						capabilities = require("blink.cmp").get_lsp_capabilities(),
						settings = {
							pylsp = {
								plugins = {
									pycodestyle = { enabled = false },
								},
							},
						},
					})
				end,

				["lua_ls"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.lua_ls.setup({
						capabilities = require("blink.cmp").get_lsp_capabilities(),
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,
				["clangd"] = function()
					local lspconfig = require("lspconfig")
					lspconfig.clangd.setup({
						capabilities = require("blink.cmp").get_lsp_capabilities(),
						cmd = { "clangd", "--function-arg-placeholders=false" },
					})
				end,
			},
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})
	end,
}
