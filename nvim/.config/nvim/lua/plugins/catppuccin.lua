return {
    "catppuccin/nvim",
    name = "catppuccin",
    -- load before other plugins
    priority = 1000,
    opts = {
        flavour = mocha,
        -- optional integrations
        integrations = {
            blink_cmp = {
                style = "bordered",
            },
            gitsigns = true,
            snacks = true,
            treesitter = true,
            which_key = true,
        },
        -- overwrite docstring highlighting to be green
        custom_highlights = function(colors)
            return {
                ["@string.documentation"] = { fg = colors.green },
            }
        end,
    },
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
