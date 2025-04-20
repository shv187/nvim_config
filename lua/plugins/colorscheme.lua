return {
    {
        'rebelot/kanagawa.nvim',
        name = 'kanagawa',
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        config = function()
            require('rose-pine').setup({
                variant = 'moon',
                dark_variant = 'moon',
            })
        end,
    },
    {
        'datsfilipe/vesper.nvim',
    },
    { 'catppuccin/nvim', name = 'catppuccin', lazy = false, priority = 1000 },
    {
        'Mofiqul/vscode.nvim',
        lazy = false,
        priority = 1000,
    },
    { 'EdenEast/nightfox.nvim', lazy = false, priority = 1000 },
    { 'projekt0n/github-nvim-theme', lazy = false, priority = 1000 },
    { 'slugbyte/lackluster.nvim', lazy = false, priority = 1000 },
    {
        'wtfox/jellybeans.nvim',
        lazy = false,
        priority = 1000,
        opts = {},
    },
}
