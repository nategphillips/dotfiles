return {
    -- conform is a formatting plugin that calls cli tools inside neovim
    "stevearc/conform.nvim",
    -- load after reading a buffer into memory
    event = "BufReadPost",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                python = {
                    -- fix auto-fixable lint errors
                    "ruff_fix",
                    -- run the Ruff formatter
                    "ruff_format",
                    -- organize the imports
                    "ruff_organize_imports",
                },
                tex = {
                    -- very fast formatter written in rust by the way, doesn't align things like &=
                    -- formulae in align blocks though
                    -- configuration is in ~/.config/tex-fmt/tex-fmt.toml
                    "tex-fmt"
                }
            },
            format_on_save = {
                -- :h conform.format to see all options
                -- set async = true to avoid timeouts entirely
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
        -- if a formatter for conform isn't explicitly installed above, it will fall back to the
        -- LSP's implementation, if available (for example, lua_ls includes a formatter by default,
        -- so it gets called since I don't have one installed here)
        vim.keymap.set({ "n", "v" }, "<leader>gf", function()
            require("conform").format({
                timeout_ms = 500,
                lsp_format = "fallback",
            })
        end, { desc = "Format with conform.nvim" })
    end,
}
