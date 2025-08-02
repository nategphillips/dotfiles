return {
    -- todo-comments provides highlighting and search support for todo-like comments in source code
    "folke/todo-comments.nvim",
    -- load after reading a buffer into memory
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
}
