return {
    'MeanderingProgrammer/render-markdown.nvim',
    -- only load for markdown files
    ft = { "markdown" },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
}
