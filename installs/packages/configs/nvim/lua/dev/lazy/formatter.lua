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
      javascript = { "oxfmt" },
      javascriptreact = { "oxfmt" },
      typescript = { "oxfmt" },
      typescriptreact = { "oxfmt" },
      markdown = { "prettier" },
      elixir = { "mix" },
      eex = { "mix" },
      heex = { "mix" },
    },
  },
}
