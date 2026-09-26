return {
  "nvim-mini/mini.ai",
  event = "VeryLazy",
  config = function()
    local ai = require("mini.ai")
    ai.setup({
      n_lines = 500,
      custom_textobjects = {
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
        o = ai.gen_spec.treesitter({ a = "@block.outer", i = "@block.inner" }),
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        d = { "%f[%d]%d+" },
      },
    })
  end,
}
