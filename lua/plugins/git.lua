return {
  -- gitsigns: essential inline git signs + hunk actions (with buffer-local mappings in on_attach)
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    opts = {
      signs = {
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      watch_gitdir = { follow_files = true },
      auto_attach = true,
      attach_to_untracked = false,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 50,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      },
      current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
    config = function(_, opts)
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
          -- map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
        end
      }
    end,
    -- A few safe global keys (non-buffer-local). Keep repo-level commands on <leader>g and hunk commands under <leader>h
    keys = {
      { "<leader>gD", "<cmd>Gitsigns diffthis<CR>",                  desc = "Gitsigns diff hunk" },
      { "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle current line blame" },
    },
  },

  -- diffview: nice commit/branch/file diffs and history
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>",          desc = "Diffview open" },
      { "<leader>gq", "<cmd>DiffviewClose<CR>",         desc = "Diffview close" },
      { "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", desc = "Diffview file history" },
    },
    opts = {
      use_icons = true,
      enhanced_diff_hl = true,
      view = {
        default = { winbar_info = false },
      },
    },
  },

  -- fugitive: battle-tested git porcelain (lazy-load on :Git)
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    keys = {
      { "<leader>gs", "<cmd>Git<CR>",       desc = "Git status (Fugitive)" },
      { "<leader>gB", "<cmd>Git blame<CR>", desc = "Git blame (Fugitive)" },
    },
  },

  -- small diff helpers plugin (optional)
  {
    "barrettruth/diffs.nvim",
    cmd = { "Diffs" },
  },
}
