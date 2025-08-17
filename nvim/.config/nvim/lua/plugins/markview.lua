return {
    -- markview.nvim is a pretty previewer for markdown, latex, typst, and yaml
    "OXY2DEV/markview.nvim",
    -- this plugin is already lazy-loaded, so don't make it redundant
    lazy = false,

    -- For `nvim-treesitter` users - after colorscheme
    priority = 49,

    preview = {
        icon_provider = "mini",
    },

    filetypes = { "markdown" },

    -- For blink.cmp's completion source - this makes blink load on startup, which I don't like
    -- dependencies = {
    --     "saghen/blink.cmp"
    -- },
};
