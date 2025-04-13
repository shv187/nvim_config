return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    opts = function()
        local logo = [[
 ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓
 ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒
▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░
▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ 
▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒
░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░
░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░
   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   
         ░    ░  ░    ░ ░        ░   ░         ░   
                                ░                  
        ]]

        logo = string.rep('\n', 8) .. logo .. '\n\n'

        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        local builtin = require('telescope.builtin')

        local opts = {
            theme = 'doom',
            hide = {
                statusline = false,
            },
            config = {
                header = vim.split(logo, '\n'),

                center = {
                    { action = builtin.find_files, desc = ' Find File', icon = ' ', key = 'f' },
                    { action = 'ene | startinsert', desc = ' New File', icon = ' ', key = 'n' },
                    { action = builtin.oldfiles, desc = ' Recent Files', icon = ' ', key = 'r' },
                    { action = builtin.live_grep, desc = ' Find Text', icon = ' ', key = 'g' },
                    { action = 'lua require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })', desc = ' Config', icon = ' ', key = 'c' },
                    { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
                    {
                        action = function()
                            vim.api.nvim_input('<cmd>qa<cr>')
                        end,
                        desc = ' Quit',
                        icon = ' ',
                        key = 'q',
                    },
                },
                footer = function()
                    local stats = require('lazy').stats()
                    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                    return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
                end,
            },
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
            button.key_format = '  %s'
        end

        -- open dashboard after closing lazy
        if vim.o.filetype == 'lazy' then
            vim.api.nvim_create_autocmd('WinClosed', {
                pattern = tostring(vim.api.nvim_get_current_win()),
                once = true,
                callback = function()
                    vim.schedule(function()
                        vim.api.nvim_exec_autocmds('UIEnter', { group = 'dashboard' })
                    end)
                end,
            })
        end

        return opts
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
