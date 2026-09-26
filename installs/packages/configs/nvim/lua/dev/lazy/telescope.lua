return {
    {
        'nvim-telescope/telescope.nvim',
        tag = 'v0.1.9',
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        cmd = { "Telescope" },
        keys = {
            { "<leader>pf", function() require('telescope.builtin').find_files() end, desc = "Find files" },
            { "<C-p>", function() require('telescope.builtin').git_files() end, desc = "Find git files" },
            { "<leader>fb", function() require('telescope.builtin').buffers() end, desc = "Find buffers" },
            {
                "<leader>ps",
                function()
                    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
                end,
                desc = "Grep string",
            },
            { "<leader>lg", function() require('telescope.builtin').live_grep() end, desc = "Live grep" },
            { "<leader>ls", function() require('telescope.builtin').lsp_document_symbols() end, desc = "Document symbols" },
            { "<leader>vh", function() require('telescope.builtin').help_tags() end, desc = "Help tags" },
        },
        config = function()
            require("telescope").setup {
                defaults = {
                    file_ignore_patterns = { '.git/' }
                }
            }
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }
            require("telescope").load_extension("ui-select")
        end
    }
}