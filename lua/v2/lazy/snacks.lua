return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    zen = {
      toggles = {
        dim = false,
        gitsigns = false,
        mini_diff_signs = false,
        diagnostics = false,
        inlay_hints = false,
      },
      show = {
        statusline = false,
        tabline = true,
      },
      win = { style = "zen" },
    },
    indent = {},
    quickfile = {},
  },

  keys = {
    { "<leader>z", function() Snacks.zen() end,      desc = "Toggle Zen Mode" },
    { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
  },
}
