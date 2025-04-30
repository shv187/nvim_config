return {
    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-telescope/telescope.nvim' },
        config = function()
            local harpoon = require('harpoon')
            harpoon:setup()

            local conf = require('telescope.config').values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                require('telescope.pickers')
                    .new({}, {
                        prompt_title = 'Harpoon',
                        finder = require('telescope.finders').new_table({
                            results = file_paths,
                        }),
                        previewer = conf.file_previewer({}),
                        sorter = conf.generic_sorter({}),
                    })
                    :find()
            end

            harpoon:extend({
                UI_CREATE = function(cx)
                    vim.keymap.set('n', '<C-v>', function()
                        harpoon.ui:select_menu_item({ vsplit = true })
                    end, { buffer = cx.bufnr })

                    vim.keymap.set('n', '<C-x>', function()
                        harpoon.ui:select_menu_item({ split = true })
                    end, { buffer = cx.bufnr })

                    vim.keymap.set('n', '<C-t>', function()
                        harpoon.ui:select_menu_item({ tabedit = true })
                    end, { buffer = cx.bufnr })
                end,
            })

            vim.keymap.set('n', '<leader>hA', function()
                harpoon:list():prepend()
            end, { desc = 'Prepend Harpoon list' })

            vim.keymap.set('n', '<leader>ha', function()
                harpoon:list():add()
            end, { desc = 'Append Harpoon list' })

            vim.keymap.set('n', '<leader>e', function()
                toggle_telescope(harpoon:list())
            end, { desc = 'Toggle Harpoon Telescope Picker' })

            for i = 1, 4 do
                vim.keymap.set('n', '<A-' .. i .. '>', function()
                    harpoon:list():select(i)
                end, { desc = 'Select ' .. i .. ' Harpoon mark' })

                vim.keymap.set('n', '<leader>hr' .. i, function()
                    harpoon:list():replace_at(i)
                end, { desc = 'Replace ' .. i .. ' Harpoon mark' })
            end
        end,
    },
}
