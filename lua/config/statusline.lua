vim.opt.laststatus = 3

-- ==============================
-- Git branch
-- ==============================
local function get_git_branch()
  local file_dir = vim.fn.expand("%:p:h")
  if file_dir == "" then return "" end

  local git_dir = vim.fn.finddir(".git", file_dir .. ";")
  if git_dir == "" then return "" end

  local handle = io.popen("git -C " .. file_dir .. " branch --show-current 2>/dev/null")
  if not handle then return "" end

  local branch = handle:read("*a")
  handle:close()

  branch = branch:gsub("%s+", "")
  if branch == "" then return "" end

  return " " .. branch
end

-- ==============================
-- Git diff stats
-- ==============================
local function get_git_diff()
  local file = vim.fn.expand("%:p")
  if file == "" then return "" end

  local file_dir = vim.fn.expand("%:p:h")
  local git_dir = vim.fn.finddir(".git", file_dir .. ";")
  if git_dir == "" then return "" end

  local cmd = "git -C " .. file_dir .. " diff --numstat -- " .. vim.fn.shellescape(file)
  local handle = io.popen(cmd .. " 2>/dev/null")
  if not handle then return "" end


  local output = handle:read("*a")
  handle:close()

  if output == "" then return "" end

  local added, removed = output:match("(%d+)%s+(%d+)")
  if not added then return "" end

  added = tonumber(added) or 0
  removed = tonumber(removed) or 0
  local changed = math.min(added, removed)

  local parts = {}
  if added > 0 then table.insert(parts, "+" .. added) end
  if changed > 0 then table.insert(parts, "~" .. changed) end
  if removed > 0 then table.insert(parts, "-" .. removed) end

  if #parts == 0 then return "" end

  return table.concat(parts, " ")
end

-- ==============================
-- LSP diagnostics
-- ==============================
local function get_diagnostics()
  local bufnr = 0

  local errors = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.ERROR })
  local warns  = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.WARN })
  local info   = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.INFO })
  local hints  = #vim.diagnostic.get(bufnr, { severity = vim.diagnostic.severity.HINT })

  local parts = {}
  if errors > 0 then table.insert(parts, "E:" .. errors) end
  if warns  > 0 then table.insert(parts, "W:" .. warns) end
  if info   > 0 then table.insert(parts, "I:" .. info) end
  if hints  > 0 then table.insert(parts, "H:" .. hints) end

  if #parts == 0 then return "" end

  return table.concat(parts, " ")
end

-- ==============================
-- Main statusline
-- ==============================
function _G.statusline()
  local branch = get_git_branch()
  local diff   = get_git_diff()
  local diag   = get_diagnostics()

  local left_parts = {
    "%f",
    "%M",
  }

  if branch ~= "" then table.insert(left_parts, branch) end
  if diff   ~= "" then table.insert(left_parts, diff) end
  if diag   ~= "" then table.insert(left_parts, diag) end

  local left = table.concat(left_parts, " ")

  return string.format(
    " %s %%= %%l:%%c %%p%%%% ♥ ",
    left
  )
end

vim.o.statusline = "%!v:lua.statusline()"
