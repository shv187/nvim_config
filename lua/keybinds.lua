-- clear highlight on esc after searching
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- may not work in all terminals, otherwise <C-\><C-n>
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', 'vaa', 'gg<S-V>G', { desc = 'Select everything' })

vim.keymap.set('n', '<leader>_', '<C-W>s', { desc = 'Split Window Horizontally' })
vim.keymap.set('n', '<leader>\\', '<C-W>v', { desc = 'Split Window Vertically' })

vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })

-- todo: move it to the top and change everything to this
local map = vim.keymap.set

-- find a way to actually create tabs in a simple _way_
map('n', ']<tab>', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
map('n', '[<tab>', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })
map('n', '<tab>', '<cmd>tabnext<cr>', { desc = 'Next Tab' })
map('n', '<s-tab>', '<cmd>tabprevious<cr>', { desc = 'Previous Tab' })
for i = 1, 9 do
    map('n', '<leader><tab>' .. i, '<cmd>tabn ' .. i .. '<cr>', { desc = 'Tab ' .. i })
end

-- yank to clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Yank to clipboard' })

-- delete without trashing register
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = 'Delete without trashing register' })

map('n', '<leader>fruc', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Find and replace word under cursor' })

-- better block moving
map('v', '<', '<gv')
map('v', '>', '>gv')

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
