-- AstroLSP customizations for Neovim 0.12 + Go tooling.

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      -- Prefer dedicated formatters over language-server formatters where both exist
      disabled = {
        "lua_ls", -- use stylua
        "ts_ls", -- use prettier via null-ls
      },
      timeout_ms = 3000,
    },
    config = {
      gopls = {
        settings = {
          gopls = {
            gofumpt = true,
            analyses = {
              unusedparams = true,
              shadow = true,
            },
            staticcheck = true,
            hints = {
              assignVariableTypes = true,
              compositeLiteralFields = true,
              compositeLiteralTypes = true,
              constantValues = true,
              functionTypeParameters = true,
              parameterNames = true,
              rangeVariableTypes = true,
            },
          },
        },
      },
    },
  },
}
