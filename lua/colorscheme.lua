-- vim.pack.add({
--   src = "https://github.com/mcauley-penney/techbase.nvim"
-- })
--
-- require('techbase').setup({})
--

vim.pack.add({
  "https://github.com/rose-pine/neovim"
})

require("rose-pine").setup({
  variant = "auto",      -- auto, main, moon, or dawn
  dark_variant = "main", -- main, moon, or dawn
  dim_inactive_windows = false,
  extend_background_behind_borders = true,

  enable = {
    terminal = true,
    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
    migrations = true,        -- Handle deprecated options automatically
  },

  styles = {
    bold = false,
    italic = true,
    transparency = false,
  },

  groups = {
    border = "muted",
    link = "iris",
    panel = "surface",

    error = "love",
    hint = "iris",
    info = "foam",
    note = "pine",
    todo = "rose",
    warn = "gold",

    git_add = "foam",
    git_change = "rose",
    git_delete = "love",
    git_dirty = "rose",
    git_ignore = "muted",
    git_merge = "iris",
    git_rename = "pine",
    git_stage = "iris",
    git_text = "rose",
    git_untracked = "subtle",

    h1 = "iris",
    h2 = "foam",
    h3 = "rose",
    h4 = "gold",
    h5 = "pine",
    h6 = "foam",
  },

  palette = {
    -- Override the builtin palette per variant
    -- moon = {
    --     base = '#18191a',
    --     overlay = '#363738',
    -- },
  },

  -- NOTE: Highlight groups are extended (merged) by default. Disable this
  -- per group via `inherit = false`
  highlight_groups = {
    -- Comment = { fg = "foam" },
    -- StatusLine = { fg = "love", bg = "love", blend = 15 },
    -- VertSplit = { fg = "muted", bg = "muted" },
    -- Visual = { fg = "base", bg = "text", inherit = false },

    -- Blink CMP HGs
    BlinkCmpMenuSelection = { fg = "base", bg = "rose" },

    -- Telescope HGs
    TelescopeNormal = { fg = "subtle", bg = "overlay" },
    TelescopeBorder = { fg = "overlay", bg = "overlay" },
    TelescopePromptNormal = { fg = "text", bg = "surface" },
    TelescopePromptBorder = { fg = "surface", bg = "surface" },
    TelescopeSelection = { fg = "none", bg = "highlight_low" },
    TelescopePromptTitle = { fg = "base", bg = "rose" },
    TelescopeResultsTitle = { fg = "base", bg = "rose" },
    TelescopePreviewTitle = { fg = "base", bg = "rose" },
    TelescopeMatching = { fg = "rose", bg = "none" },

    -- Status + tabline
    StatusLine = { fg = "love", bg = "love", blend = 10 },
    TabLine = { fg = "love", bg = "love", blend = 10 },
    TabLineSel = { fg = "love", bg = "love", blend = 20 },

    CmdLine = { fg = "love", bg = "love", blend = 10 },
    MsgArea = { fg = "love", bg = "love", blend = 10 },
  },
}
)

vim.cmd("colorscheme rose-pine")
