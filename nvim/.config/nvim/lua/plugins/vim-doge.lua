return {
    -- vim-doge automatically generates docstrings for several languages using treesitter
    "kkoomen/vim-doge",
    -- only load for python files
    ft = { "python" },
    init = function()
        -- disable default keymaps (they conflict)
        vim.g.doge_enable_mappings = false
        -- set default Python docstring style
        vim.g.doge_doc_standard_python = 'google'
    end,
    vim.keymap.set('n', '<leader>dg', '<CMD>DogeGenerate<CR>'),
}
