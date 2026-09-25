vim.loader.enable()

-- disable netrw (neo-tree is our file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local dir_augroup = vim.api.nvim_create_augroup("NeoTreeOpen", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = dir_augroup,
  callback = function()
    -- Only auto-open the tree for a bare `nvim` or when opening a directory.
    local first_arg = vim.fn.argv(0)
    local opening_dir = vim.fn.argc() == 1 and vim.fn.isdirectory(first_arg) == 1
    if vim.fn.argc() == 0 or opening_dir then
      vim.cmd("Neotree")
    end
  end,
})

require("thememondude")
