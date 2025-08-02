return {
    "mason-org/mason-lspconfig.nvim",
    -- load before reading a buffer into memory
    event = "BufReadPre",
    opts = {
        -- NOTE: texlab is used for autocompletion/snippets in latex, while ltex is a grammar/spell
        --       checker

        -- ltex_plus is better maintained fork of ltex
        ensure_installed = { "lua_ls", "basedpyright", "ruff", "texlab", "ltex_plus" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
