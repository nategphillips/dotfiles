return {
    -- nvim-treesitter provides syntax highlighting support using ASTs
    "nvim-treesitter/nvim-treesitter",
    -- treesitter does not support lazy loading
    lazy = false,
    -- The only branch working on Neovim 0.12+ is `main`.
    branch = "main",
    build = ":TSUpdate",
    -- This minimal config is pulled from [here](https://mhpark.me/posts/update-treesitter-main/).
    -- More configs of varying quality/complexity can be found [here](https://www.reddit.com/r/neovim/comments/1pndf9e/my_new_nvimtreesitter_configuration_for_the_main/).
    config = function()
        local ts = require 'nvim-treesitter'
        local parsers = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "query",
            "markdown",
            "markdown_inline",
            "python",
            "julia",
            "rust",
            "yaml",
            "html",
            "bash",
            "powershell",
            "toml",
            -- This seems to lag render-markdown out the wazoo.
            -- "latex",
            "xml",
            "regex",
        }

        -- Ensure parsers are installed.
        for _, parser in ipairs(parsers) do
            ts.install(parser)
        end

        -- Table containing filetype patterns to start treesitter on.
        local patterns = {}

        -- Not every tree-sitter parser is the same as the file type detected, so the patterns need
        -- to be registered more cleverly.
        for _, parser in ipairs(parsers) do
            local parser_patterns = vim.treesitter.language.get_filetypes(parser)
            for _, pp in pairs(parser_patterns) do
                table.insert(patterns, pp)
            end
        end

        -- Highlighting is now enabled by starting treesitter manually on each file.
        vim.api.nvim_create_autocmd('FileType', {
            pattern = patterns,
            callback = function()
                vim.treesitter.start()
            end,
        })

        -- Folding (not enabled by default).
        -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo[0][0].foldmethod = 'expr'

        -- Indents (not enabled by default).
        -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
}
