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
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
    },

    config = function()
      local cmp = require('cmp')
      local cmp_lsp = require("cmp_nvim_lsp")
      local elixir_ls_server = vim.fn.expand("~/elixir-ls/language_server.sh")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())


      vim.lsp.enable('lua_ls')
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "Lua 5.1" },
            diagnostics = {
              globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
            }
          }
        }
      })

      vim.lsp.enable('emmet_language_server')
      vim.lsp.config("emmet_language_server", {
        capabilities = capabilities,
        filetypes = { "css", "html", "javascript", "javascriptreact", "sass", "scss", "typescriptreact", "eex", "heex", "html-eex", "elixir", "svelte" },
      })

      -- vim.lsp.enable "expert"
      -- vim.lsp.config('expert', {
      --   cmd = { 'expert', '--stdio' },
      --   root_markers = { 'mix.exs', '.git' },
      --   filetypes = { 'elixir', 'eelixir', 'heex' },
      -- })

      vim.lsp.enable('elixirls')
      vim.lsp.config('elixirls', {
        cmd = { elixir_ls_server },
      })

      vim.lsp.enable('ts_ls')
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })

      vim.lsp.enable('tailwindcss')
      vim.lsp.config('tailwindcss', {
        capabilities = capabilities,
        classAttributes = { "class", "className", "class:list", "classList" },
        includeLanguages = {
          eelixir = "html-eex",
          elixir = "html-eex",
          heex = "html-eex",
          css = "css",
          javascript = "html",
          javascriptreact = "html",
          svelte = "html"
        },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning"
        },
        validate = true

      })

      -- require("conform").setup({
      --   formatters_by_ft = {
      --     javascript = { "standardjs" },
      --     javascriptreact = { "standardjs" }
      --   }
      -- })

      -- require("fidget").setup({})
      --
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      --
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- For luasnip users.
          { name = "luasnip" },  -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      })
      --
      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end
  }
}
