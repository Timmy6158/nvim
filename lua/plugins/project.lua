return {
  {
    "ahmedkhalf/project.nvim",
    lazy = true,
    config = function()
      require("project_nvim").setup({
        -- Project root detection methods
        detection_methods = { "lsp", "pattern" },

        -- Patterns to detect project root
        patterns = { ".git", "Makefile", "package.json" },

        -- Excluded directories
        exclude_dirs = { "node_modules", "vendor", ".git" },

        -- Recent projects
        show_recent_projects = true,

        -- Telescope integration
        telescope = {
          theme = "dropdown",
        },
      })
    end,
  },
}
