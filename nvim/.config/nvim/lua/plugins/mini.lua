return {
    "echasnovski/mini.nvim",
    -- load after reading a buffer into memory
    event = "BufRead",
    version = false,
    config = function()
        -- comment out lines with gcc in normal mode, or gc in visual mode
        require("mini.comment").setup({})
        -- move selected lines around with <Alt-hjkl>
        require("mini.move").setup({})
        -- autocomplete ([{}]) pairs
        require("mini.pairs").setup({})
    end,
}
