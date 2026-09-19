return {
    -- mason-lspconfig interfaces between mason and nvim-lspconfig
    "mason-org/mason-lspconfig.nvim",
    -- load before reading a buffer into memory
    event = "BufReadPre",
    opts = {
        ensure_installed = {
            -- lua_ls for basic lua support because why not
            "lua_ls",
            -- ty for static type checking in python
            "ty",
            -- ruff is installed here for linting highlights while editing, but it's also called
            -- from the cli via conform, not sure if this is ideal but whatever
            "ruff",
            -- texlab for latex autocompletion/snippets
            "texlab",
            -- ltex_plus is a more maintained fork of ltex that provides grammar and spell checking
            "ltex_plus",
            -- many features of julials (go to definition, all warnings, etc.) don't seem to work
            -- with neovim anymore after their move to JuliaWorkspaces.jl on 13-07-2026...
            -- unfortunately, this seems to be a vscode-first plugin (sigh), which means it's
            -- unlikely to get fixed anytime soon - JETLS.jl seems to be a better language server
            -- anyway
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
