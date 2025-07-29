return {
    "lervag/vimtex",
    -- VimTeX shouldn't be lazy loaded (it has filetype associations that autoload it)
    lazy = false,
    init = function()
        -- zathura needs the zathura-pdf-mupdf extension to open PDFs
        vim.g.vimtex_view_method = "zathura"
        -- prevent warnings from opening the error dialog box each time the document is compiled
        vim.g.vimtex_quickfix_open_on_warning = 0
    end
}
