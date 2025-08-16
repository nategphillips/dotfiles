return {
    -- mini is a collection of minimal yet useful plugins
    "echasnovski/mini.nvim",
    -- load before reading a buffer into memory
    event = "BufReadPre",
    -- use the main branch
    version = false,
    config = function()
        -- comment out lines with gcc in normal mode, or gc in visual mode
        require("mini.comment").setup()
        -- provides icons for things like snacks, statusline, and tabline
        require("mini.icons").setup()
        -- mocks exported functions of nvim-web-devicons if a plugin doesn't support mini.icons
        -- MiniIcons.mock_nvim_web_devicons()
        -- move selected lines around with <Alt-hjkl>
        require("mini.move").setup()
        -- autocomplete ([{}]) pairs - this was pissing me off honestly
        -- require("mini.pairs").setup()
        -- simple statusline
        require("mini.statusline").setup()
        -- simple tabline
        require("mini.tabline").setup()
    end,
}
