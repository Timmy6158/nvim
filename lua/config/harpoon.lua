local harpoon = require("harpoon")

harpoon:setup({})

-- basic telescope configuration
local conf = require("telescope.config").values
local function toggle_telescope(harpoon_files)
  local file_paths = {}
  for _, item in ipairs(harpoon_files.items) do
    table.insert(file_paths, item.value)
  end

  require("telescope.pickers").new({}, {
    prompt_title = "Harpoon",
    finder = require("telescope.finders").new_table({
      results = file_paths,
    }),
    previewer = conf.file_previewer({}),
    sorter = conf.generic_sorter({}),
  }):find()
end
-- Keymaps for Harpoon
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add file to Harpoon" })
vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Navigate to Harpoon file 1" })
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Navigate to Harpoon file 2" })
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Navigate to Harpoon file 3" })
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Navigate to Harpoon file 4" })

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Previous Harpoon buffer" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Next Harpoon buffer" })

vim.keymap.set("n", "<leader>hh", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
