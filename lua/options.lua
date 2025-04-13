vim.cmd('set expandtab')
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = 'a'

vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.showmode = false

-- keep indent on line break
vim.opt.breakindent = true

vim.opt.undofile = true

-- \C or capital letters in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- idk if it even works
vim.opt.inccommand = 'split'

vim.opt.cursorline = true

-- min lines above and below cursor
vim.opt.scrolloff = 10

-- :q on unsaved buffer creates a dialog
vim.opt.confirm = true

vim.opt.termguicolors = true
