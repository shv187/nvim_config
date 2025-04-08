return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  lazy = false,
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
      filesystem = {
        window = { 
            mappings = { 
                ['\\'] = 'close_window',
                ['P'] = { 
                    'toggle_preview',
                    config = {
                        use_float = false,
                    }
                },
            }, 
        },
      },
  },
}
