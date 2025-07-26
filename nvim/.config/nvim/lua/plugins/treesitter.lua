return {
    "nvim-treesitter/nvim-treesitter",
    -- treesitter does not support lazy loading
    lazy = false,
    -- the default branch will switch to main in the future, but the documentation for it is horrible right now
    branch = "master",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "query", "markdown", "markdown_inline", "python"},
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
        })
    end,
}
