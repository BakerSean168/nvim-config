-- This will run last in the setup process.
-- Ensure toolchain binaries (especially Go under /usr/local/go/bin) are visible
-- to Neovim, Mason, and child processes even when the editor is launched without
-- a full interactive shell profile.

local function prepend_path(dir)
  if dir == "" or vim.fn.isdirectory(dir) == 0 then
    return
  end
  local path = vim.env.PATH or ""
  local needle = ":" .. dir .. ":"
  if (":" .. path .. ":"):find(needle, 1, true) then
    return
  end
  vim.env.PATH = dir .. ":" .. path
end

prepend_path "/usr/local/go/bin"
prepend_path(vim.fn.expand "~/go/bin")
prepend_path(vim.fn.stdpath "data" .. "/mason/bin")
