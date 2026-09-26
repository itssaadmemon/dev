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

-- centered motions
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page up (centered)" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev result (centered)" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines (keep cursor)" })
vim.keymap.set("n", "=ap", "ma=ap'a", { desc = "Reindent paragraph (keep cursor)" })

-- register-safe yank/delete
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank line to system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>D", '"_d', { desc = "Delete to void" })

-- misc
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "chmod +x" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Location list next" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Location list prev" })