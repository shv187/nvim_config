return {
    'evanmcneely/enlighten.nvim',
    event = 'VeryLazy',
    keys = {
        {
            '<leader>ae',
            function()
                require('enlighten').edit()
            end,
            desc = 'Edit',
            mode = { 'n', 'v' },
        },
        {
            '<leader>ac',
            function()
                require('enlighten').chat()
            end,
            desc = 'Chat',
            mode = { 'n', 'v' },
        },
        {
            '<leader>ay',
            function()
                require('enlighten').keep()
            end,
            desc = 'Keep change',
            mode = { 'n', 'v' },
        },
        {
            '<leader>aY',
            function()
                require('enlighten').keep_all()
            end,
            desc = 'Keep all changes',
            mode = 'n',
        },
        {
            '<leader>an',
            function()
                require('enlighten').discard()
            end,
            desc = 'Discard change',
            mode = { 'n', 'v' },
        },
        {
            '<leader>aN',
            function()
                require('enlighten').discard_all()
            end,
            desc = 'Discard all changes',
            mode = 'n',
        },
    },
    config = function()
        require('enlighten').setup({
            ai = {
                provider = 'anthropic',
                model = 'claude-3-5-sonnet-20241022', -- 'claude-3-7-sonnet-20250219',
                temperature = 0,
                tokens = 4096,
                timeout = 300, -- recommended to keep very high
            },
            settings = {
                context = 500, -- lines above and below the selected text passed to the model as context
                -- Can be "diff" or "change" or "off":
                -- - "diff" will show added and removed lines with DiffAdd and DiffRemove highlights
                -- - "change" when a hunk has both added and removed lines, this will show only generated content with DiffText highlights
                -- - "off" will not add highlights around generated content (use other tooling to review, accept and revert changes)
                diff_mode = 'diff',
                edit = {
                    width = 80, -- prompt window width
                    height = 5, -- prompt window height
                    showTitle = true, -- show the title in the prompt window
                    showHelp = true, -- show the help footer in the prompt window
                    border = '═', -- top/bottom border character of prompt window
                },
                chat = {
                    width = 80, -- chat window width
                    split = 'right', -- split the chat window 'left' or 'right'
                },
            },
        })
    end,
}
