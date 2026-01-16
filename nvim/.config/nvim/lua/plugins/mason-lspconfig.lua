return {
    -- mason-lspconfig interfaces between mason and nvim-lspconfig
    "mason-org/mason-lspconfig.nvim",
    -- load before reading a buffer into memory
    event = "BufReadPre",
    opts = {
        ensure_installed = {
            -- lua_ls for basic lua support because why not
            "lua_ls",
            -- basedpyright is an improved fork of pyright for static type checking in python
            "basedpyright",
            -- ruff is installed here for linting highlights while editing, but it's also called
            -- from the cli via conform, not sure if this is ideal but whatever
            "ruff",
            -- texlab for latex autocompletion/snippets
            "texlab",
            -- ltex_plus is a more maintained fork of ltex that provides grammar and spell checking
            "ltex_plus",
            -- julials is broken(!) when installed with mason right now, so it's installed manually
            --      - see https://github.com/mason-org/mason-lspconfig.nvim/issues/582
            --      - and https://discourse.julialang.org/t/neovim-languageserver-jl-crashing-again/130273/3
        },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
