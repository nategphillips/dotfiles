return {
    -- helpview.nvim is a pretty viewer for neovim help files
    "OXY2DEV/helpview.nvim",
    -- load after reading a buffer into memory
    event = "BufReadPost",
    -- -- this plugin is already lazy-loaded, so don't make it redundant
    -- lazy = false,

    preview = {
        icon_provider = "mini",
    }
};
