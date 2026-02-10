return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- -- Function to get the current mode indicator as a single character
    local function mode()
      -- Map of modes to their respective shorthand indicators
      local mode_map = {
        n = "N",      -- Normal mode
        i = "I",      -- Insert mode
        v = "V",      -- Visual mode
        [""] = "V",   -- Visual block mode
        V = "V",      -- Visual line mode
        c = "C",      -- Command-line mode
        no = "N",     -- NInsert mode
        s = "S",      -- Select mode
        S = "S",      -- Select line mode
        ic = "I",     -- Insert mode (completion)
        R = "R",      -- Replace mode
        Rv = "R",     -- Virtual Replace mode
        cv = "C",     -- Command-line mode
        ce = "C",     -- Ex mode
        r = "R",      -- Prompt mode
        rm = "M",     -- More mode
        ["r?"] = "?", -- Confirm mode
        ["!"] = "!",  -- Shell mode
        t = "T",      -- Terminal mode
      }
      -- Return the mode shorthand or [UNKNOWN] if no match
      return mode_map[vim.fn.mode()] or "[UNKNOWN]"
    end

    local filename = {
      "filename",
      file_status = true,     -- Displays file status (readonly status, modified status)
      newfile_status = false, -- Display new file status (new file means no write after created)
      path = 1,               -- 0: Just the filename
      -- 1: Relative path
      -- 2: Absolute path
      -- 3: Absolute path, with tilde as the home directory
      -- 4: Filename and parent dir, with tilde as the home directory

      shorting_target = 40, -- Shortens path to leave 40 spaces in the window
      -- for other components. (terrible name, any suggestions?)
      -- It can also be a function that returns
      -- the value of `shorting_target` dynamically.
      symbols = {
        modified = "[+]",      -- Text to show when the file is modified.
        readonly = "[-]",      -- Text to show when the file is non-modifiable or readonly.
        unnamed = "[No Name]", -- Text to show for unnamed buffers.
        newfile = "[New]",     -- Text to show for newly created file before first write
      },
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = { error = "E ", warn = "W ", info = "I ", hint = "H " },
      colored = true,
      update_in_insert = false,
      always_visible = false,
      cond = function()
        return vim.bo.filetype ~= "markdown"
      end,
    }

    local lsp_status = {
      "lsp_status",
      icon = "", -- f013
      symbols = {
        -- Standard unicode symbols to cycle through for LSP progress:
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        -- Standard unicode symbol for when LSP is done:
        done = "✓",
        -- Delimiter inserted between LSP names:
        separator = " ",
      },
      -- List of LSP names to ignore (e.g., `null-ls`):
      ignore_lsp = {},
      -- Display the LSP name
      show_name = true,
    }

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
          refresh_time = 16, -- ~60fps
          events = {
            "WinEnter",
            "BufEnter",
            "BufWritePost",
            "SessionLoadPost",
            "FileChangedShellPost",
            "VimResized",
            "Filetype",
            "CursorMoved",
            "CursorMovedI",
            "ModeChanged",
          },
        },
      },
      sections = {
        -- lualine_a = { mode },
        -- lualine_b = { "branch", "diff", diagnostics },
        -- lualine_c = { "filename" },
        -- lualine_x = {},
        -- lualine_y = { "progress" },
        -- lualine_z = { "location" },

        lualine_a = { "branch" },
        lualine_b = { "diff" },
        lualine_c = { diagnostics },
        lualine_x = { lsp_status },
        lualine_y = { "tabs", "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        -- lualine_a = {},
        -- -- lualine_b = { filename },
        -- lualine_b = {},
        -- lualine_c = {},
        -- lualine_x = {},
        -- lualine_y = {},
        -- -- lualine_z = { "tabs" },
      },
      winbar = {
        lualine_a = {},
        lualine_b = { filename },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = { filename },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {},
    })
  end,
}
