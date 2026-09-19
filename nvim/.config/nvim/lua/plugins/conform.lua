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
                    -- very fast formatter written in rust by the way, and now has support for
                    -- aligning tables
                    -- configuration is in ~/.config/tex-fmt/tex-fmt.toml
                    "tex-fmt"
                }
            },
            -- :h conform.format to see all options
            format_after_save = {
                -- formatting after save allows async to be used, which is useful for things like
                -- the Runic.jl formatter coupled with JETLS.jl, which is pretty slow to apply
                -- changes
                async = true,
                lsp_format = "fallback"
            },
        })
        -- if a formatter for conform isn't explicitly installed above, it will fall back to the
        -- LSP's implementation, if available (for example, lua_ls includes a formatter by default,
        -- so it gets called since I don't have one installed here)
        vim.keymap.set({ "n", "v" }, "<leader>gf", function()
            require("conform").format({
                async = true,
                lsp_format = "fallback"
            })
        end, { desc = "Format with conform.nvim" })
    end,
}
