return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- optional but recommended
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local function theme_wrapper(telescope_command)
            return function()
                telescope_command(require("telescope.themes").get_ivy())
            end
        end

        --- Keymaps
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>F", theme_wrapper(builtin.resume), { desc = "Telescope resume last picker" })

        -- Standard
        vim.keymap.set("n", "<leader>ff", theme_wrapper(builtin.find_files), { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", theme_wrapper(builtin.live_grep), { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", theme_wrapper(builtin.buffers), { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", theme_wrapper(builtin.help_tags), { desc = "Telescope help tags" })
        vim.keymap.set("n", "<leader>fo", theme_wrapper(builtin.oldfiles), { desc = "Telescope old files" })
        vim.keymap.set("n", "<leader>fa", theme_wrapper(builtin.builtin), { desc = "Telescope find pickers" })


        -- LSP
        vim.keymap.set("n", "<leader>fr", theme_wrapper(builtin.lsp_references), { desc = "Telescope LSP references" })
        vim.keymap.set("n", "<leader>fs", theme_wrapper(builtin.lsp_document_symbols), { desc = "Telescope LSP document symbols" })
        vim.keymap.set("n", "<leader>fD", theme_wrapper(builtin.diagnostics), { desc = "Telescope diagnostics" })
        vim.keymap.set("n", "<leader>fi", theme_wrapper(builtin.lsp_implementations), { desc = "Telescope LSP implementations" })
        vim.keymap.set("n", "<leader>fd", theme_wrapper(builtin.lsp_definitions), { desc = "Telescope LSP definition" })

        -- Git
        vim.keymap.set("n", "<leader>gc", theme_wrapper(builtin.git_commits), { desc = "Telescope git commits" })
        vim.keymap.set("n", "<leader>gC", theme_wrapper(builtin.git_bcommits), { desc = "Telescope git buffer commits" })
        vim.keymap.set("n", "<leader>gb", theme_wrapper(builtin.git_branches), { desc = "Telescope git branches" })
        vim.keymap.set("n", "<leader>gs", theme_wrapper(builtin.git_status), { desc = "Telescope git status" })
    end,
}
