return {
    'tzachar/highlight-undo.nvim',
    opts = {
        hlgroup = 'HighlightUndo',
        duration = 300,
        pattern = { '*' },
        ignored_filetypes = { 'dashboard', 'neo-tree', 'fugitive', 'TelescopePrompt', 'mason', 'lazy' },
    },
}
