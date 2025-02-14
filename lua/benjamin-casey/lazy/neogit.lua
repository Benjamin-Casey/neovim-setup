return {
  {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
    "echasnovski/mini.pick",         -- optional
  },
  config = true,
  keys = {
      { "<leader>gs", "<cmd>Neogit<CR>"}
    }
}
}
