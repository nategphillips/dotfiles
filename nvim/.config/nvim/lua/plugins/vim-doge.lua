return {
    -- vim-doge automatically generates docstrings for several languages using treesitter
    "kkoomen/vim-doge",
    -- load after reading a buffer into memory
    event = "BufRead",
    vim.keymap.set('n', '<leader>dg', '<CMD>DogeGenerate google<CR>')
}
