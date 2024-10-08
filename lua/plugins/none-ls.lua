-- ~/.config/nvim/lua/plugins/none-ls.lua
return {
  "nvimtools/none-ls.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  opts = function(_, opts)
    local null_ls = require("null-ls")
    opts.sources = opts.sources or {}
    -- Add the sources you want to use
    table.insert(opts.sources, null_ls.builtins.completion.spell)
    table.insert(opts.sources, null_ls.builtins.diagnostics.mypy)
    table.insert(opts.sources, null_ls.builtins.formatting.black)

    -- Setup autoformatting on save
    vim.api.nvim_create_augroup("LspFormatting", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = "LspFormatting",
      callback = function()
        if vim.lsp.buf.format then
          vim.lsp.buf.format({ async = false })
        end
      end,
    })
  end,
}
