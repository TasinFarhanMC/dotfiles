return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local telescope = require "telescope"
    local actions = require "telescope.actions"
    local keymap = vim.keymap

    keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', { noremap = true, silent = true })
    keymap.set('n', '<leader>fs', ':Telescope live_grep<CR>', { noremap = true, silent = true })
    keymap.set('n', '<leader>fc', ':Telescope grep_string<CR>', { noremap = true, silent = true })

    telescope.setup({
      defaults = {
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-f>"] = actions.preview_scrolling_up
          }
        }
      }
    })

    telescope.load_extension("fzf")
  end
}
