vim.pack.add({
  "https://github.com/mason-org/mason-lspconfig.nvim",
  -- dependencies
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/j-hui/fidget.nvim",
})

require("mason").setup()
require("fidget").setup()

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
          ignore = { "W391", "E501" },
          maxLineLength = 88,
        },
      },
    },
  },
})
require("mason-lspconfig").setup()
