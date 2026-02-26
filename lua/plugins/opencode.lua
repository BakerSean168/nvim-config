-- ~/.config/nvim/lua/plugins/opencode.lua

return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*", -- 使用最新的稳定版本
    dependencies = {
      {
        -- 强烈推荐集成 `snacks.nvim`，用于提供更好的输入框和选择器 UI
        "folke/snacks.nvim",
        optional = true,
        opts = {
          input = {},
          picker = {
            actions = {
              opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
          terminal = {},
        },
      },
    },
    config = function()
      -- 你的个性化配置可以写在这个表里
      vim.g.opencode_opts = {}

      -- 必须开启自动重载，以便在 opencode 修改文件后 Neovim 能自动刷新
      vim.o.autoread = true

      -- 作者推荐的快捷键绑定
      vim.keymap.set(
        { "n", "x" },
        "<C-a>",
        function() require("opencode").ask("@this: ", { submit = true }) end,
        { desc = "Ask opencode…" }
      )
      vim.keymap.set(
        { "n", "x" },
        "<C-x>",
        function() require("opencode").select() end,
        { desc = "Execute opencode action…" }
      )
      vim.keymap.set({ "n", "t" }, "<C-.>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

      -- 文本对象/范围操作快捷键
      vim.keymap.set(
        { "n", "x" },
        "go",
        function() return require("opencode").operator "@this " end,
        { desc = "Add range to opencode", expr = true }
      )
      vim.keymap.set(
        "n",
        "goo",
        function() return require("opencode").operator "@this " .. "_" end,
        { desc = "Add line to opencode", expr = true }
      )

      -- 会话滚动快捷键
      vim.keymap.set(
        "n",
        "<S-C-u>",
        function() require("opencode").command "session.half.page.up" end,
        { desc = "Scroll opencode up" }
      )
      vim.keymap.set(
        "n",
        "<S-C-d>",
        function() require("opencode").command "session.half.page.down" end,
        { desc = "Scroll opencode down" }
      )

      -- 注意：由于上面把 Neovim 原生用于数字加减的 <C-a> 和 <C-x> 占用了，
      -- 作者贴心地把原生的加减功能重新绑定到了 "+" 和 "-" 键上
      vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
      vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
    end,
  },
}
