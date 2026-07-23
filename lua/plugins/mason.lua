-- Customize Mason tool installation for this environment.

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Core
        "lua-language-server",
        "stylua",
        "tree-sitter-cli",

        -- Web frontend (HTML/CSS/JSON)
        "html-lsp",
        "css-lsp",
        "json-lsp",
        "prettier",

        -- JavaScript / TypeScript / React
        "typescript-language-server",
        "js-debug-adapter",

        -- Vue
        "vue-language-server",

        -- Python
        "pyright",
        "black",
        "isort",
        "debugpy",

        -- Go
        "gopls",
        "gofumpt",
        "delve",

        -- Rust
        "rust-analyzer",
        "codelldb",

        -- Astro
        "astro-language-server",

        -- Shell
        "bash-language-server",
        "shellcheck",
        "shfmt",

        -- YAML
        "yaml-language-server",
        "yamllint",
      },
    },
  },
}
