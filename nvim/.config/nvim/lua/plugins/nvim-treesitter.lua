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
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
                "python",
                "julia",
                "yaml",
                "html",
                "bash",
                "powershell",
                "toml",
                "latex",
                "xml",
            },
            highlight = {
                enable = true,
                -- the vimtex plugin takes care of syntax highlighting for latex files, but latex
                -- inside markdown files needs the treesitter parser
                disable = { "latex" },
                -- disabling recommended by catppuccin docs
                additional_vim_regex_highlighting = false
            },
            -- explicitly disable treesitter indent just in case
            indent = {
                enable = false
            }
        })
    end,
}
