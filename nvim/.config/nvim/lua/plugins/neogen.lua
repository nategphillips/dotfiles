return {
    -- neogen automatically generates docstrings for several languages using treesitter
    "danymat/neogen",
    config = true,
    -- only load for julia and python files
    ft = { "julia", "python" },
    vim.api.nvim_set_keymap("n", "<leader>dg", ":lua require('neogen').generate()<CR>", { noremap = true, silent = true })
}
