vim.g.mapleader = " "
require("thememondude.set")
require("thememondude.lazy_init")
require("thememondude.remap")

local augroup = vim.api.nvim_create_augroup
local LocalGroup = augroup('LocalGroup', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
  group = LocalGroup,
  callback = function(e)
    local function map(mode, lhs, rhs, desc)
      vim.keymap.set(mode, lhs, rhs, {
        buffer = e.buf,
        desc = desc,
      })
    end
    map("n", "<leader>gd", vim.lsp.buf.definition, "Goto definition")
    map("n", "<leader>h", vim.lsp.buf.hover, "Hover")
    map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbol")
    map("n", "<leader>d", vim.diagnostic.open_float, "Diagnostic float")
    map("n", "<leader>dn", vim.diagnostic.goto_next, "Next diagnostic")
    map("n", "<leader>dN", vim.diagnostic.goto_prev, "Prev diagnostic")
    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("n", "<leader>rr", vim.lsp.buf.references, "References")
    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
    map("i", "<leader><C-h>", vim.lsp.buf.signature_help, "Signature help")
  end
})

-- vim.g.netrw_browse_split = 0
