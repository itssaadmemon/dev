return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({
      delay = 300,
    })
    wk.add({
      { "<leader>b", group = "buffer/tree" },
      { "<leader>c", group = "code" },
      { "<leader>d", group = "diagnostics" },
      { "<leader>f", group = "format" },
      { "<leader>g", group = "goto" },
      { "<leader>l", group = "lsp/search" },
      { "<leader>p", group = "file/find" },
      { "<leader>r", group = "references/rename" },
      { "<leader>s", group = "split/search" },
      { "<leader>t", group = "test" },
      { "<leader>u", group = "undo" },
      { "<leader>v", group = "window/help" },
      { "<leader>w", group = "workspace" },
      { "<leader>x", group = "diagnostics/quickfix" },
      { "<leader>z", group = "zen" },
      { "[", group = "prev" },
      { "]", group = "next" },
    })
  end,
}