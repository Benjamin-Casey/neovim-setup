return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    require("telescope").setup({})

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>F", "<cmd>Telescope<CR>", {
      desc = "Telescope pickers"
    })

    -- Standard
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {
      desc = "Telescope find files",
    })
    vim.keymap.set("n", "<leader>fF", builtin.git_files, {
      desc = "Telescope help tags",
    })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, {
      desc = "Telescope live grep",
    })
    -- vim.keymap.set("n", "<leader>fB", builtin.buffers, {
    -- 	desc = "Telescope buffers",
    -- })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {
      desc = "Telescope help tags",
    })

    -- Git integrations
    vim.keymap.set("n", "<leader>fc", builtin.git_commits, {
      desc = "Telescope git commits",
    })
    vim.keymap.set("n", "<leader>fC", builtin.git_bcommits, {
      desc = "Telescope git commits with respect to current buffer?",
    })
    vim.keymap.set("n", "<leader>fb", builtin.git_branches, {
      desc = "Telescope git branches",
    })
    vim.keymap.set("n", "<leader>fs", builtin.git_status, {
      desc = "Telescope git status",
    })
    vim.keymap.set("n", "<leader>fS", builtin.git_stash, {
      desc = "Telescope git stash",
    })

    -- LSP Pickers
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, {
      desc = "Telescope LSP references",
    })
    vim.keymap.set("n", "<leader>fD", builtin.diagnostics, {
      desc = "Telescope diagnostics",
    })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {
      desc = "Telescope lsp_definitions",
    })
    vim.keymap.set("n", "<leader>fo", builtin.lsp_document_symbols, {
      desc = "Telescope lsp document symbols",
    })
  end,
}
