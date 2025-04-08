-- TODO: create some better way to manage color schemes

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
--          require('rose-pine').setup({
--              variant = 'moon',
--             dark_variant = 'moon',
--          })
--
--           vim.opt.background = 'dark'
-- 		vim.cmd("colorscheme rose-pine")
-- 	end
-- }

return {
    'rebelot/kanagawa.nvim',
    name = 'kanagawa',
    config = function()
        vim.opt.background = 'dark'
        vim.cmd('colorscheme kanagawa')
    end,
}
