return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- Disable the grep telescope
    -- { "<leader>/", false },
    -- Telescope custom keymap
    {
      "<leader>/",
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = '[/] Fuzzily search in current buffer'
    },
  },
  extensions = {
    -- extension config
    require("telescope").load_extension("projects"),
  },
}
