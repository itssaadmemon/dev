-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- reselect indenting
vim.keymap.set('v', '<', '<gv', { desc = "Outdent (reselect)" })
vim.keymap.set('v', '>', '>gv', { desc = "Indent (reselect)" })

-- register paste
vim.keymap.set('v', 'p', '"_dP', { desc = "Paste over selection" })

-- copy/paste mapping
-- vim.keymap.set("v", "<C-c>", '"+y')
-- vim.keymap.set("v", "<C-x>", '"+x')
-- vim.keymap.set("i", "<C-v>", ':set paste<CR>"*p:set nopaste<CR>')

vim.keymap.set("n", "<leader>;", vim.cmd.nohlsearch, { desc = "Clear search highlight" })

-- split movement mapping
vim.keymap.set("n", "<C-k>", '<c-w><c-k>', { desc = "Window up" })
vim.keymap.set("n", "<C-j>", '<c-w><c-j>', { desc = "Window down" })
vim.keymap.set("n", "<C-l>", '<c-w><c-l>', { desc = "Window right" })
vim.keymap.set("n", "<C-h>", '<c-w><c-h>', { desc = "Window left" })

-- split it
vim.keymap.set("n", "<leader>vs", vim.cmd.vsplit, { desc = "Split vertical" })
vim.keymap.set("n", "<leader>s", vim.cmd.split, { desc = "Split horizontal" })

-- Buffers Switching
vim.keymap.set("n", "<left>", vim.cmd.bprevious, { desc = "Previous buffer" })
vim.keymap.set("n", "<right>", vim.cmd.bnext, { desc = "Next buffer" })


vim.keymap.set("n", "Q", "<nop>", { desc = "Disable ex mode" })

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { desc = "Source file" })