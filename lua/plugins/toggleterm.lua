return {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
        open_mapping = [[<c-\>]],
        direction = 'float',
        float_opts = {
            border = 'single',
            width = math.floor(vim.o.columns * 0.75),
            height = math.floor(vim.o.lines * 0.75),
        },
    },
}
