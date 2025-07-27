return {
    "neovim/nvim-lspconfig",
    -- load after reading a buffer into memory
    event = "BufRead",
    config = function()
        vim.lsp.enable("lua_ls")
        vim.lsp.enable("basedpyright")
        vim.lsp.enable("texlab")
        vim.lsp.enable("ltex_plus")

        vim.keymap.set('n', "gh", vim.lsp.buf.hover, { desc = "LSP [h]over" })
        -- conform.nvim handles formatting and allows for fallbacks to the LSP if a formatter isn't
        -- explicitly installed, so this line isn't necessary
        -- vim.keymap.set('n', "<leader>gf", vim.lsp.buf.format, { desc = "LSP [f]ormat" })
        vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP [c]ode [a]ctions" })
        vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, { desc = "LSP [r]e[n]ame" })
    end,
}
