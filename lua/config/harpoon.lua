local harpoon = require("harpoon")

-- Global configuration
harpoon:setup({
  settings = {
    save_on_toggle = false,
    sync_on_ui_close = false,
    key = function()
      return vim.loop.cwd()
    end,
  },
})

-- Basic telescope configuration
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

-- Enhanced keymaps with descriptions
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
  { desc = "Harpoon: Add File" })
vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
  { desc = "Harpoon: Quick Menu" })

-- Quick file navigation
vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end,
  { desc = "Harpoon: File 1" })
vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end,
  { desc = "Harpoon: File 2" })
vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end,
  { desc = "Harpoon: File 3" })
vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end,
  { desc = "Harpoon: File 4" })

-- Navigation through list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end,
  { desc = "Harpoon: Previous File" })
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end,
  { desc = "Harpoon: Next File" })

-- Telescope integration
vim.keymap.set("n", "<leader>hf", function() toggle_telescope(harpoon:list()) end,
  { desc = "Harpoon: Find File" })

vim.keymap.set("n", "<leader>hd", function()
  local list = harpoon:list()
  local items = list:display() -- Using list() to get the actual items
  if #items == 0 then
    print("No marks to delete")
    return
  end

  -- Create display items with file paths
  local display_items = {}
  for i, item in ipairs(items) do
    local display_path = vim.fn.fnamemodify(item, ":~:.")
    if display_path and display_path ~= "" then
      table.insert(display_items, string.format("%d: %s", i, display_path))
    end
  end

  if #display_items == 0 then
    print("No valid marks found")
    return
  end

  vim.ui.select(display_items, {
    prompt = "Select file to remove from Harpoon:",
  }, function(_, idx)
    if idx then
      local removed_path = items[idx]
      list:remove_at(idx)
      print("Removed " .. vim.fn.fnamemodify(removed_path, ":~:.") .. " from Harpoon")
    end
  end)
end, { desc = "Remove specific file from Harpoon" })
