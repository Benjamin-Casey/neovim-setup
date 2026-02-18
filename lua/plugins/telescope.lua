return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- optional but recommended
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>fp", builtin.builtin, { desc = "Telescope find files" })

    -- Standard
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope old files" })

    -- LSP
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope LSP references" })
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Telescope LSP document symbols" })
    vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "Telescope diagnostics" })
    vim.keymap.set("n", "<leader>fi", builtin.lsp_implementations, { desc = "Telescope LSP implementations" })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Telescope LSP definition" })

    -- Git
    vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "Telescope git commits" })
    vim.keymap.set("n", "<leader>gC", builtin.git_bcommits, { desc = "Telescope git buffer commits" })
    vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope git branches" })
    vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Telescope git status" })
  end,
}
