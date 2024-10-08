return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")

    lspconfig.pyright.setup({})
    -- Configure docker-compose-language-service
    lspconfig.docker_compose_language_service.setup({})

    -- Configure dockerfile-language-server
    lspconfig.dockerls.setup({})

    -- Configure lua-language-server
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
            path = vim.split(package.path, ";"),
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- Configure typescript-language-server
    lspconfig.tsserver.setup({})
  end,
}
