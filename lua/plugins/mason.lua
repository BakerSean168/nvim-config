-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Mason

---@type LazySpec
return {
  -- use mason-tool-installer for automatically installing Mason packages
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-tool-installer").setup(...)`
    opts = {
      -- Make sure to use the names found in `:Mason`
      ensure_installed = {
        -- install language servers
        "lua-language-server",

        -- install formatters
        "stylua",

        -- install debuggers
        "debugpy",

        -- install any other package
        "tree-sitter-cli",

        -- ============================
        -- 1. Web 前端核心 (HTML/CSS/JSON)
        -- ============================
        "html-lsp",                -- HTML 提示
        "css-lsp",                 -- CSS/SCSS/LESS 提示
        "json-lsp",                -- JSON 提示
        "prettier",                -- 【神器】通用格式化 (支持 JS/TS/Vue/HTML/CSS)

        -- ============================
        -- 2. JavaScript / TypeScript / React
        -- ============================
        -- 注意：React 的支持直接包含在 TS 的 LSP 中
        "typescript-language-server", -- JS/TS 的 LSP (也就是 tsserver)
        "js-debug-adapter",           -- JS/TS 调试器

        -- ============================
        -- 3. Vue
        -- ============================
        "vue-language-server",        -- Vue (Volar) LSP

        -- ============================
        -- 4. Python
        -- ============================
        "pyright",                    -- Python LSP (微软出品，速度快)
        "black",                      -- Python 格式化 (代码风格)
        "isort",                      -- Python 导入自动排序
        "debugpy",                    -- Python 调试器

        -- ============================
        -- 5. Go (Golang)
        -- ============================
        "gopls",                      -- Go LSP (官方)
        "gofumpt",                    -- Go 格式化 (比 gofmt 更严格)
        "delve",                      -- Go 调试器 (dlv)

        -- ============================
        -- 6. Rust
        -- ============================
        "rust-analyzer",              -- Rust LSP
        "codelldb",                   -- Rust/C++ 调试器

        -- ============================
        -- 7. Astro
        -- ============================
        "astro-language-server",
      },
    },
  },
}
