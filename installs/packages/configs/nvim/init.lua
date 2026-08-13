vim.loader.enable()

-- disable netrw (neo-tree is our file explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local dir_augroup = vim.api.nvim_create_augroup("NeoTreeOpen", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = dir_augroup,
  callback = function()
    vim.cmd("Neotree")
  end,
})

require("thememondude")