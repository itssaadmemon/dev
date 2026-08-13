return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      desc = "Format buffer (standardjs)",
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { "standardjs" },
      javascriptreact = { "standardjs" },
      typescript = { "standardjs" },
      typescriptreact = { "standardjs" },
    },
  },
}