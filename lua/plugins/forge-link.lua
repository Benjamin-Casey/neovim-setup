return {
  "aaaaargZombies/forge-link.nvim",
  opts = {},
  config = function()
    local keymap = vim.api.nvim_set_keymap

    local opts = { noremap = true }

    -- FORGE-LINK
    keymap("v", "<leader>ll", "<cmd>ForgeLink<cr>", opts)
    keymap("v", "<leader>ln", "<cmd>ForgeNav<cr>", opts)
    keymap("v", "<leader>ls", "<cmd>ForgeSnip<cr>", opts)
    keymap("n", "<leader>ll", "<cmd>ForgeLink<cr>", opts)
  end
}
