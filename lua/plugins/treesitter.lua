-- Customize Treesitter (AstroNvim v6+)
-- Treesitter options are configured via AstroCore because nvim-treesitter
-- (main branch) is primarily a parser download utility.

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true,
      indent = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",

        -- Web frontend
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "yaml",

        -- Go
        "go",

        -- Python
        "python",

        -- Tools / docs
        "bash",
        "dockerfile",
        "markdown",
        "markdown_inline",
        "c",
      },
    },
  },
}
