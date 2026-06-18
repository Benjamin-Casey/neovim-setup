return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim" -- Used for synchronous shell commands
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Helper function to run shell commands safely
    local function run_cmd(cmd)
      local handle = io.popen(cmd)
      if not handle then return "" end
      local result = handle:read("*a")
      handle:close()
      return result:gsub("%s+$", "") -- Trim trailing whitespace
    end

    -- Fetch Git Information
    local function get_git_status()
      -- Check if we are inside a git repo
      local is_repo = run_cmd("git rev-parse --is-inside-work-tree 2>/dev/null")
      if is_repo ~= "true" then
        return { " Not a git repository" }
      end

      -- Get branch name
      local branch = run_cmd("git branch --show-current")

      -- Get short status summary (modified, untracked, etc.)
      local stats = run_cmd("git status --porcelain | wc -l | tr -d ' '")
      local status_text = stats == "0" and " Clean" or ("󰚰 " .. stats .. " pending changes")

      -- Get last 3 commit messages
      local commits = run_cmd("git log -5 --oneline --format='  %-7h │ %s'")

      -- Format the dashboard output
      local lines = {
        " Branch: " .. branch,
        "󰊢 Status: " .. status_text,
        "",
        " Recent Commits:",
      }

      for commit in commits:gmatch("[^\r\n]+") do
        table.insert(lines, commit)
      end

      return lines
    end

    -- 1. Header Section
    dashboard.section.header.val = {
      "                _    <3   _  ",
      "    __   ___.--'_`.     .'_`--.___   __  ",
      "   ( _`.'. -   'o` )   ( 'o`   - .`.'_ )  ",
      "   _\\.'_'      _.-'     `-._      `_`./_  ",
      "  ( \\`. )    //\\`         '/\\    ( .'/ )  ",
      "   \\_`-'`---'\\__,       ,__//`---'`-'_/  ",
      "    \\`        `-\\         /-'        '/  ",
      "     `                               '  ",
      "  							frogs kissing  ",
      "  				  Now that's data-BASED  "
    }

    -- 2. Git Status Section (Customized)
    local git_section = {
      type = "text",
      val = get_git_status(),
      opts = {
        position = "center",
        hl = "Comment", -- Muted grey look, you can change to "String" or "Identifier"
      },
    }

    -- 3. Buttons Section
    dashboard.section.buttons.val = {
      dashboard.button("ff", "  Find File", "<cmd>Telescope find_files<CR>"),
      dashboard.button("fo", "󰄉  Recent Files", "<cmd>Telescope oldfiles<CR>"),
      dashboard.button("fg", "󰱼  Find Text", "<cmd>Telescope live_grep<CR>"),
      dashboard.button("gg", "󰊢  Fugitive", "<cmd>vert Git<CR>"),
      dashboard.button("c", "  Config", "<cmd>e $MYVIMRC <CR>"),
      dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
    }

    -- 4. Footer Section
    -- dashboard.section.footer.val = "Neovim loaded successfully!"
    dashboard.section.footer.opts.hl = "Type"

    -- Layout assembly
    dashboard.config.layout = {
      { type = "padding", val = 3 },
      dashboard.section.header,
      { type = "padding", val = 3 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      git_section, -- Insert git info right here
      -- { type = "padding", val = 1 },
      -- dashboard.section.footer,
    }

    alpha.setup(dashboard.config)
  end,
}
