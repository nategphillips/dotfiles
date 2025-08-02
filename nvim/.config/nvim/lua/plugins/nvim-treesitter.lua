return {
    -- nvim-treesitter provides syntax highlighting support using ASTs
    "nvim-treesitter/nvim-treesitter",
    -- treesitter does not support lazy loading
    lazy = false,
    -- the default branch will switch to main in the future, but the documentation for it is horrible right now
    branch = "master",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            -- don't install a parser for latex, the vimtex plugin already takes care of syntax
            -- highlighting
            ensure_installed = { "c", "lua", "query", "markdown", "markdown_inline", "python" },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            },
        })
    end,
}
