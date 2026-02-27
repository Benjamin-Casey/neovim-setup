-- icons
vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons'
})


-- nvim-treesitter
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", },
})

local ts = require("nvim-treesitter")

vim.api.nvim_create_autocmd("PackChanged", {
  pattern = { "nvim-treesitter" },
  callback = function(event)
    vim.notify("Updating treesitter parsers", vim.log.levels.INFO)
    vim.cmd("TSUpdate")
    ts.update(nil, { summary = true }):wait(30 * 1000)
  end
})

ts.setup({
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,
  highlight = {
    enabled = true,
  },
})


-- telescope
vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  -- optional but recommended
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
})

require("telescope").setup({})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>F", builtin.builtin, { desc = "Telescope find files" })

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


-- oil
vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
})

vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>")

require("oil").setup({
  view_options = {
    show_hidden = true,
  },
})


-- blink-cmp
vim.pack.add({
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("*") },
})

require("blink.cmp").setup({
  -- Disable for markdown files
  enabled = function()
    return not vim.tbl_contains({ "markdown" }, vim.bo.filetype)
  end,

  keymap = {
    preset = "super-tab",
  },

  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "mono",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" },

  cmdline = {
    keymap = { preset = "inherit" },
    completion = { menu = { auto_show = false } },
  },
})


-- flash
vim.pack.add({
  "https://github.com/folke/flash.nvim",
})

require("flash").setup({})

vim.keymap.set("n", "s", function()
  require("flash").jump()
end, { desc = "Flash" })
vim.keymap.set("n", "S", function()
  require("flash").treesitter()
end, { desc = "Flash treesitter" })
vim.keymap.set("n", "R", function()
  require("flash").treesitter_search()
end, { desc = "Flash treesitter search" })


-- mini.ai
vim.pack.add({
  "https://github.com/echasnovski/mini.ai",
})

require("mini.ai").setup({})


-- conform
vim.pack.add({
  "https://github.com/eandrju/cellular-automaton.nvim",
})



-- cellular-automaton
vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    python = { "isort", "black" },
  },
})

vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  conform.format({
    lsp_fallback = true,
    async = true,
    timeout_ms = 1000,
  })
end, { desc = "Format file or range (in visual mode)" })


--- Git
-- fugitive
vim.pack.add({
  "https://github.com/tpope/vim-fugitive",
})

vim.keymap.set("n", "<leader>gg", "<cmd>vert Git<CR>", { desc = "Git status (Fugitive)" })
vim.keymap.set("n", "<leader>gB", "<cmd>Git blame<CR>", { desc = "Git blame (Fugitive)" })


-- diffs
vim.pack.add({
  "https://github.com/barrettruth/diffs.nvim",
})

vim.g.diffs = {
  -- neogit = true,
  fugitive = true,
}


-- diffview
vim.pack.add({
  "https://github.com/sindrets/diffview.nvim",
})

vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "Diffview open" })
vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "Diffview close" })
vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview file history" })


-- gitsigns
vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})

require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('n', '<leader>hr', gitsigns.reset_hunk)

    map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)

    map('n', '<leader>hb', function()
      gitsigns.blame_line({ full = true })
    end)

    map('n', '<leader>hd', gitsigns.diffthis)

    map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end)

    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
  end
}
