return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
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
      },
    },
  },
  {
    'everviolet/nvim',
    name = 'evergarden',
    priority = 1000,
    opts = {
      theme = {
        variant = 'fall',
        accent = 'green',
      },
      editor = {
        transparent_background = false,
        sign = { color = 'none' },
        float = {
          color = 'mantle',
          solid_border = false,
        },
        completion = {
          color = 'surface0',
        },
      },
      -- Adding the highlight overrides here
      overrides = function(palette)
        return {
          -- Blink CMP HGs (Mapping Rose -> Aqua/Green)
          BlinkCmpMenuSelection = { fg = palette.base, bg = palette.aqua, bold = true },

          -- Telescope HGs
          TelescopeNormal = { fg = palette.subtext0, bg = palette.surface0 },
          TelescopeBorder = { fg = palette.surface0, bg = palette.surface0 },
          TelescopePromptNormal = { fg = palette.text, bg = palette.surface1 },
          TelescopePromptBorder = { fg = palette.surface1, bg = palette.surface1 },
          TelescopeSelection = { fg = palette.none, bg = palette.surface2 },
          TelescopePromptTitle = { fg = palette.base, bg = palette.green },
          TelescopeResultsTitle = { fg = palette.base, bg = palette.green },
          TelescopePreviewTitle = { fg = palette.base, bg = palette.green },

          StatusLine = { fg = palette.purple, bg = "None" },
          StatusMode = { fg = palette.base, bg = palette.green },
          StatusBranch = { fg = palette.green, bg = palette.surface1 },
          CmdLine = { fg = palette.text, bg = "None" },
          MsgArea = { fg = palette.text, bg = "None" },

        }
      end,
    }
  },
}

-- Others:
-- https://github.com/mcauley-penney/techbase.nvim
