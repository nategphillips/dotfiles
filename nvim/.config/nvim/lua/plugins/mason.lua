return {
    -- mason is a package manager for lsp servers, formatters, and linters
    "mason-org/mason.nvim",
    -- load before reading a buffer into memory
    event = "BufReadPre",
    opts = {},
}
