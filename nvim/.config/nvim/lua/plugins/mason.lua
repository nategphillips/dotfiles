return {
    -- mason is a package manager for lsp servers, formatters, and linters
    "mason-org/mason.nvim",
    -- load after reading a buffer into memory
    event = "BufRead",
    opts = {},
}
