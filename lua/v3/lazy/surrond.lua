return {
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "<leader>sa",
          normal_cur = "<leader>sas",
          normal_line = "<leader>saS",
          normal_cur_line = "<leader>saSS",
          visual = "<leader>sa",
          visual_line = "<leader>sA",
          delete = "<leader>sd",
          -- change = "<leader>sc",
          change_line = "<leader>sC",
        },
      })
    end
  }
}
