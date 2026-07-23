-- Prefer aerial.nvim v4 on Neovim 0.12 (drops deprecated node:start() APIs).
-- AstroNvim 6.0.5 still pins ^3 via snapshot; override to the latest stable major.

---@type LazySpec
return {
  "stevearc/aerial.nvim",
  version = "^4",
}
