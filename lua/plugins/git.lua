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
        delay = 1000,
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

      -- Buffer-local mappings and behavior when gitsigns attaches to a buffer.
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")

        local function map(mode, lhs, rhs, desc, opts)
          opts = opts or {}
          opts.buffer = bufnr
          if desc then opts.desc = desc end
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            gitsigns.next_hunk()
          end
        end, "Next git hunk")

        map("n", "[c", function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            gitsigns.prev_hunk()
          end
        end, "Previous git hunk")

        -- Actions (stage/reset/etc)
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
        map("n", "<leader>hS", gitsigns.stage_buffer, "Stage buffer")
        map("n", "<leader>hu", gitsigns.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hp", gitsigns.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, "Blame line (full)")
        map("n", "<leader>hR", gitsigns.reset_buffer, "Reset buffer")
        map("n", "<leader>hd", gitsigns.diffthis, "Diff this")
        map("n", "<leader>hD", function() gitsigns.diffthis("~") end, "Diff this vs HEAD~")
        map("n", "<leader>ht", gitsigns.toggle_deleted, "Toggle deleted lines")
        -- map("n", "<leader>h%", gitsigns.toggle_word_diff, "Toggle word diff")
        -- map("n", "<leader>h=", gitsigns.toggle_signs, "Toggle signs")
        -- map("n", "<leader>h#", gitsigns.toggle_linehl, "Toggle line highlight")
        -- map("n", "<leader>h.", gitsigns.toggle_numhl, "Toggle number highlight")

        -- Optional: quick commands to stage/reset based on visual selection
        -- map("v", "<leader>hs", function() vim.cmd(":'<,'>Gitsigns stage_hunk") end, "Stage visual hunk")
        -- map("v", "<leader>hr", function() vim.cmd(":'<,'>Gitsigns reset_hunk") end, "Reset visual hunk")
      end,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
    -- A few safe global keys (non-buffer-local). Keep repo-level commands on <leader>g and hunk commands under <leader>h
    keys = {
      { "<leader>gD", "<cmd>Gitsigns diffthis<CR>", desc = "Gitsigns diff hunk" },
      { "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<CR>", desc = "Toggle current line blame" },
    },
  },

  -- diffview: nice commit/branch/file diffs and history
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<CR>", desc = "Diffview open" },
      { "<leader>gq", "<cmd>DiffviewClose<CR>", desc = "Diffview close" },
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
      { "<leader>gs", "<cmd>Git<CR>", desc = "Git status (Fugitive)" },
      { "<leader>gB", "<cmd>Git blame<CR>", desc = "Git blame (Fugitive)" },
    },
  },

  -- small diff helpers plugin (optional)
  {
    "barrettruth/diffs.nvim",
    cmd = { "Diffs" },
  },
}
