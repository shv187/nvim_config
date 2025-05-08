-- add how many colorschemes u want
-- they are being loaded only when selected
local possible_colorschemes = {
    {
        'rebelot/kanagawa.nvim',
        name = 'kanagawa',
        lazy = false,
        priority = 1000,
        opts = {
            theme = 'dragon',
        },
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
        name = 'vesper',
    },
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
    },
    {
        'Mofiqul/vscode.nvim',
        name = 'vscode',
        lazy = false,
        priority = 1000,
    },
    {
        'EdenEast/nightfox.nvim',
        name = 'nightfox',
        lazy = false,
        priority = 1000,
    },
    {
        'projekt0n/github-nvim-theme',
        name = 'github',
        lazy = false,
        priority = 1000,
    },
    {
        'slugbyte/lackluster.nvim',
        name = 'lackluster',
        lazy = false,
        priority = 1000,
    },
    {
        'wtfox/jellybeans.nvim',
        name = 'jellybeans',
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'marko-cerovac/material.nvim',
        name = 'material',
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'sainnhe/sonokai',
        name = 'sonokai',
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        'sainnhe/gruvbox-material',
        name = 'gruvbox-material',
        lazy = false,
        priority = 1000,
    },
    {
        'thesimonho/kanagawa-paper.nvim',
        name = 'kanagawa-paper',
        lazy = false,
        priority = 1000,
        opts = {},
    },
    -- {
    --     'Yazeed1s/minimal.nvim',
    --     name = 'minimal',
    --     lazy = false,
    --     priority = 1000,
    --     opts = {},
    -- },
    {
        'ellisonleao/gruvbox.nvim',
        name = 'gruvbox',
        lazy = false,
        priority = 1000,
        opts = {
            italic = {
                strings = false,
                comments = false,
            },
            transparent_mode = true,
        },
    },
    {
        'webhooked/kanso.nvim',
        name = 'kanso',
        lazy = false,
        priority = 1000,
        opts = {
            theme = 'ink',
            disableItalics = true,
            transparent = true,
        },
    },
}

-- utility function
local function get_colorscheme_by_name(name)
    for _, v in ipairs(possible_colorschemes) do
        if v.name == name then
            return v
        end
    end

    return nil
end

------------------------------------------------
-- SETTINGS
------------------------------------------------
vim.opt.background = 'dark'
local selected_scheme_name = 'kanagawa'
local DEBUG_load_all = false
------------------------------------------------

-- utility function
local function craft_our_colorscheme(colorscheme_name)
    -- get our selected scheme from table or the first one if we cant find it
    local scheme = get_colorscheme_by_name(colorscheme_name)
        or function()
            local backup_scheme = possible_colorschemes[1]
            vim.print("Couldn't load selected colorscheme, loading backup one: " .. backup_scheme.name)
            return backup_scheme
        end

    -- backup config if it exists as we have to override it
    local old_config = scheme.config or nil

    local new_config = function()
        -- if old config exists, we execute it first
        if old_config ~= nil then
            old_config()
        else
            -- if it doesn't we get eventual opts
            -- and execute it ourselves
            local opts = scheme.opts or {}
            require(scheme.name).setup(opts)
        end

        vim.cmd('colorscheme ' .. scheme.name)
    end

    -- override or insert our new config
    scheme.config = new_config

    return scheme
end

if DEBUG_load_all then
    return possible_colorschemes
else
    return { craft_our_colorscheme(selected_scheme_name) }
end
