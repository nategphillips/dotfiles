return {
    -- nvim-lspconfig is a client used to interface with the built-in lsp server in neovim
    "neovim/nvim-lspconfig",
    -- load after reading a buffer into memory
    event = "BufRead",
    config = function()
        vim.lsp.config.basedpyright = {
            settings = {
                basedpyright = {
                    -- too many python libraries don't have proper type checking, which makes the
                    -- default setting of "recommended" throw way too many warnings
                    typeCheckingMode = "basic",
                }
            }
        }

        vim.lsp.enable("lua_ls")
        vim.lsp.enable("basedpyright")
        vim.lsp.enable("ruff")
        vim.lsp.enable("texlab")
        vim.lsp.enable("ltex_plus")
        vim.lsp.enable("julials")

        vim.keymap.set('n', "gh", vim.lsp.buf.hover, { desc = "LSP [h]over" })
        -- conform.nvim handles formatting and allows for fallbacks to the LSP if a formatter isn't
        -- explicitly installed, so this line isn't necessary
        -- vim.keymap.set('n', "<leader>gf", vim.lsp.buf.format, { desc = "LSP [f]ormat" })
        vim.keymap.set('n', "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP [c]ode [a]ctions" })
        vim.keymap.set('n', "<leader>rn", vim.lsp.buf.rename, { desc = "LSP [r]e[n]ame" })
    end,
}
