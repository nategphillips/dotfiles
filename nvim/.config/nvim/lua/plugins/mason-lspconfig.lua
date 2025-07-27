return {
    "mason-org/mason-lspconfig.nvim",
    -- load before reading a buffer into memory
    event = "BufReadPre",
    opts = {
        ensure_installed = { "lua_ls", "basedpyright", "texlab" },
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
