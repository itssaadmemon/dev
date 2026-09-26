return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all"
      ensure_installed = {
        "eex",
        "elixir",
        "erlang",
        "heex",
        "scss",
        'dockerfile',
        'gitignore',
        'html',
        'json',
        'vim',
        "vimdoc",
        "javascript",
        "typescript",
        "svelte",
        "c",
        "lua",
        "jsdoc",
        "bash",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Do not silently install parsers on buffer open (no tree-sitter CLI here).
      auto_install = false,

      indent = {
        enable = true
      },

      highlight = {
        -- `false` will disable the whole extension
        enable = true,
        disable = function(lang, buf)
          if lang == "html" then
            return true
          end

          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            vim.notify(
              "File larger than 100KB treesitter disabled for performance",
              vim.log.levels.WARN,
              { title = "Treesitter" }
            )
            return true
          end
        end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },

      -- Selection is handled by mini.ai; only wire the movement text objects here.
      textobjects = {
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
        },
      },
    })
  end
}
