return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    format_on_save = { timeout_ms = 5000, lsp_format = "fallback" },
    formatters_by_ft = {
      javascript = { "standardjs" },
      javascriptreact = { "standardjs" },
      typescript = { "standardjs" },
      typescriptreact = { "standardjs" },
      markdown = { "prettierd" },
      elixir = { "mix" },
      eex = { "mix" },
      heex = { "mix" },
    },
  },
}
