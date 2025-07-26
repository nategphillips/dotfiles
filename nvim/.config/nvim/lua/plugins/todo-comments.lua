return {
    "folke/todo-comments.nvim",
    -- load after reading a buffer into memory
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
}
