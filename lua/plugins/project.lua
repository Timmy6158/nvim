return {
  {
    "ahmedkhalf/project.nvim",
    lazy = true,
    config = function()
      require("project_nvim").setup({
        -- Project root detection methods
        detection_methods = { "pattern", "lsp" },

        -- Patterns to detect project root
        patterns = { ".git" },

        -- Search parent directory
        search_inside_files = false,

        -- Excluded directories
        exclude_dirs = {
          "node_modules",
          "__pycache__",
          ".pytest_cache",
          "*.egg-info",
          ".venv",
          "env",
          "venv",
        },

        -- This tells project.nvim to always search upwards for patterns
        scope_chdir = 'global',

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
