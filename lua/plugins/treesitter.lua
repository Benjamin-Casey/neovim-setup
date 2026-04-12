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
        -- buftype "" means it's a normal file on disk
        if vim.bo.buftype == "" then
          pcall(vim.treesitter.start)
        end
      end,
    })
  end
}
