return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,
    highlight = {
      enabled = true,
    },
  },
  config = function()
    vim.api.nvim_create_autocmd("BufReadPost", {
      pattern = "*",
      callback = function()
        -- can start a specific treesitter on a specific buffer also
        -- vim.treesitter.start(0, "c")
        vim.treesitter.start()
      end,
      once = true,
    })
  end
}
