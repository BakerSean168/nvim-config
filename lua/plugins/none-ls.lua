-- Register none-ls / null-ls sources for formatters and linters installed via Mason.

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local null_ls = require "null-ls"
    opts.sources = require("astrocore").list_insert_unique(opts.sources, {
      -- Formatters
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettier,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.isort,
      null_ls.builtins.formatting.gofumpt,
      null_ls.builtins.formatting.shfmt,

      -- Diagnostics / linters
      -- shellcheck is provided via bash-language-server; none-ls no longer ships the builtin
      null_ls.builtins.diagnostics.yamllint,
    })
  end,
}
