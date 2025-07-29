return {
    'akinsho/bufferline.nvim',
    -- load after reading a buffer into memory
    event = "BufRead",
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('bufferline').setup({})
    end,

    vim.keymap.set('n', '<leader>bl', '<Cmd>BufferLineCycleNext<CR>', { silent = true, desc = 'Next buffer' }),
    vim.keymap.set('n', '<leader>bh', '<Cmd>BufferLineCyclePrev<CR>', { silent = true, desc = 'Previous buffer' }),
}
