return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    -- -- Function to get the current mode indicator as a single character
    local function mode()
      -- Map of modes to their respective shorthand indicators
      local mode_map = {
        n = 'N',      -- Normal mode
        i = 'I',      -- Insert mode
        v = 'V',      -- Visual mode
        [''] = 'V',   -- Visual block mode
        V = 'V',      -- Visual line mode
        c = 'C',      -- Command-line mode
        no = 'N',     -- NInsert mode
        s = 'S',      -- Select mode
        S = 'S',      -- Select line mode
        ic = 'I',     -- Insert mode (completion)
        R = 'R',      -- Replace mode
        Rv = 'R',     -- Virtual Replace mode
        cv = 'C',     -- Command-line mode
        ce = 'C',     -- Ex mode
        r = 'R',      -- Prompt mode
        rm = 'M',     -- More mode
        ['r?'] = '?', -- Confirm mode
        ['!'] = '!',  -- Shell mode
        t = 'T',      -- Terminal mode
      }
      -- Return the mode shorthand or [UNKNOWN] if no match
      return mode_map[vim.fn.mode()] or '[UNKNOWN]'
    end

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn" },
      symbols = { error = "E ", warn = "W " },
      colored = true,
      update_in_insert = false,
      always_visible = false,
      cond = function()
        return vim.bo.filetype ~= "markdown"
      end,
    }

    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16, -- ~60fps
          events = {
            'WinEnter',
            'BufEnter',
            'BufWritePost',
            'SessionLoadPost',
            'FileChangedShellPost',
            'VimResized',
            'Filetype',
            'CursorMoved',
            'CursorMovedI',
            'ModeChanged',
          },
        }
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { 'branch', 'diff', diagnostics },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
