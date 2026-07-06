-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",

      -- Web 前端
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

      -- 工具
      "bash",
      "dockerfile",
      "markdown",
      "markdown_inline",
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
