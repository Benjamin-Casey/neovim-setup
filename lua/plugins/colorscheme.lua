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
  {
    "ember-theme/nvim",
    name = "ember",
    priority = 1000,
    config = function()
      require("ember").setup({
        variant = "ember",
        on_highlights = function(highlights, theme)
          -- Hex colors from your provided palette
          local bg                         = "#1c1b19" -- H45  S6%  L10%
          local bg_alt                     = "#242320" -- H30  S4%  L13% — Emacs hl-line value
          local base0                      = "#151412" -- H40  S8%  L7%
          local base1                      = "#1c1b19" -- H45  S6%  L10%
          local base2                      = "#252422" -- H40  S5%  L14%
          local base3                      = "#2e2d2a" -- H42  S5%  L17%
          local base4                      = "#3e3c38" -- H42  S5%  L23%
          local base5                      = "#585550" -- H40  S5%  L33%
          local base6                      = "#706c61" -- H43  S8%  L41%
          local base7                      = "#908a7e" -- H42  S8%  L53%
          local base8                      = "#b8b0a0" -- H40  S12% L68%
          local fg                         = "#d8d0c0" -- H42  S16% L82%
          local fg_alt                     = "#b0a898" -- H38  S12% L64%

          local coral                      = "#e08060" -- H18  S55% L63%  — hero
          local orange                     = "#c09058" -- H30  S42% L55%
          local gold                       = "#c8b468" -- H45  S42% L60%
          local olive                      = "#8a9868" -- H78  S22% L50%
          local sage                       = "#80a090" -- H150 S14% L56%
          local steel                      = "#7890a0" -- H205 S18% L55%
          local rose                       = "#b07878" -- H0   S25% L58%
          local mauve                      = "#988090" -- H315 S12% L55%

          -- Blink CMP (Mapping Rose -> Coral)
          highlights.BlinkCmpMenuSelection = { fg = bg, bg = coral }

          -- Telescope HGs
          highlights.TelescopePromptNormal = { fg = fg, bg = bg_alt }
          highlights.TelescopePromptBorder = { fg = bg_alt, bg = bg_alt }
          highlights.TelescopeSelection    = { bg = bg_alt }

          -- Titles using Coral
          highlights.TelescopePromptTitle  = { fg = bg, bg = coral }
          highlights.TelescopeResultsTitle = { fg = bg, bg = coral }
          highlights.TelescopePreviewTitle = { fg = bg, bg = coral }

          -- StatusLine & UI
          highlights.StatusLine            = { fg = mauve, bg = "NONE" }
          highlights.StatusMode            = { fg = bg, bg = coral, bold = true }
          highlights.StatusBranch          = { fg = coral, bg = bg_alt }

          highlights.CmdLine               = { fg = fg, bg = "NONE" }
          highlights.MsgArea               = { fg = fg, bg = "NONE" }
        end,
      })
    end,
  }
}

-- Others:
-- https://github.com/mcauley-penney/techbase.nvim
