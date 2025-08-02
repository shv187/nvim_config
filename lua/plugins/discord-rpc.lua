return {
    'vyfor/cord.nvim',
    build = ':Cord update',
    config = function()
        require('cord').setup({
            plugins = {
                'cord.plugins.diagnostics', -- Enable the diagnostics plugin

                ['cord.plugins.diagnostics'] = { -- Configure diagnostics plugin
                    scope = 'workspace', -- Set scope to 'workspace' instead of default 'buffer'
                    severity = vim.diagnostic.severity.WARN, -- Show warnings and above
                },
            },
        })
    end,
}
