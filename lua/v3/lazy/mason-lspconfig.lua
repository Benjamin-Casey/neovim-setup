return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    })
    vim.lsp.config('pylsp', {
      settings = {
        pylsp = {
          plugins = {
            pycodestyle = {
              -- ignore = { 'W391' },
              maxLineLength = 88
            }
          }
        }
      }
    })
    require("mason-lspconfig").setup()
  end
}
