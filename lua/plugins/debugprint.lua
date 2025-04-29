local cpp_fmtlib = {
    left = 'fmt::println("',
    right = '")',
    mid_var = '", ',
    right_var = ');',
}

local cpp_cxx23 = {
    left = 'std::println("',
    right = '")',
    mid_var = '", ',
    right_var = ');',
}

local cpp_macro = {
    left = 'debug_log("',
    right = '")',
    mid_var = '", ',
    right_var = ');',
}

return {
    'andrewferrier/debugprint.nvim',

    opts = {
        filetypes = {
            ['cpp'] = cpp_fmtlib,
        },
    },

    dependencies = {
        'echasnovski/mini.nvim',
        'ibhagwan/fzf-lua',
        'nvim-telescope/telescope.nvim',
    },

    lazy = false,
    version = '*',
}
