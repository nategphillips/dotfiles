return {
    -- mason-lspoconfig interfaces between mason and nvim-lspconfig
    "mason-org/mason-lspconfig.nvim",
    -- load before reading a buffer into memory
    event = "BufReadPre",
    opts = {
        -- lua_ls for basic lua support because why not
        -- basedpyright is an improved fork of pyright for static type checking in python
        -- ruff is installed here for linting highlights while editing, but it's also called from
        -- the cli via conform, not sure if this is ideal but whatever
        -- texlab for latex autocompletion/snippets
        -- ltex_plus is a more maintained fork of ltex that provides grammar and spell checking
        ensure_installed = { "lua_ls", "basedpyright", "ruff", "texlab", "ltex_plus" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
