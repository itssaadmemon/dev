return {
  {
    "mason-org/mason.nvim",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "stevearc/conform.nvim",
      "mason-org/mason-lspconfig.nvim",
      "j-hui/fidget.nvim",
      "saghen/blink.cmp",
    },

    config = function()
      local has_blink, blink = pcall(require, "blink.cmp")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if has_blink then
        capabilities = blink.get_lsp_capabilities(capabilities)
      end

      -- Defaults applied to every language server.
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = { version = "Lua 5.1" },
            diagnostics = {
              globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
            },
          },
        },
      })

      vim.lsp.enable("emmet_language_server")
      vim.lsp.config("emmet_language_server", {
        filetypes = { "css", "html", "javascript", "javascriptreact", "sass", "scss", "typescriptreact", "eex", "heex", "html-eex", "elixir", "svelte" },
      })

      vim.lsp.config("expert", {
        cmd = { "expert", "--stdio" },
        root_markers = { "mix.exs", ".git" },
        filetypes = { "elixir", "eelixir", "heex" },
      })
      vim.lsp.enable("expert")

      vim.lsp.enable("ts_ls")
      vim.lsp.config("ts_ls", {
        formatting = {
          format = false,
        },
      })

      vim.lsp.enable("tailwindcss")
      vim.lsp.config("tailwindcss", {
        classAttributes = { "class", "className", "class:list", "classList" },
        includeLanguages = {
          eelixir = "html-eex",
          elixir = "html-eex",
          heex = "html-eex",
          css = "css",
          javascript = "html",
          javascriptreact = "html",
          svelte = "html",
        },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning",
        },
        validate = true,
      })

      vim.lsp.enable("marksman")

      vim.diagnostic.config({
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },
}
