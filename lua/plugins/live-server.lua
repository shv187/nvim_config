return {
    'ngtuonghy/live-server-nvim',
    event = 'VeryLazy',
    build = ':LiveServerInstall',
    keys = {
        {
            '<leader>lt',
            function()
                require('live-server-nvim').toggle()
            end,
            mode = '',
            desc = '[T]oggle live server',
        },
    },
    config = function()
        require('live-server-nvim').setup({
            custom = {
                '--port=8080',
                '--no-css-inject',
            },
            serverPath = vim.fn.stdpath('data') .. '/live-server/',
            open = 'folder',
        })
    end,
}
