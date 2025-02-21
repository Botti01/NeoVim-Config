return {
  -- Null-ls (Linting e Formatting)
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- Linter
          null_ls.builtins.diagnostics.eslint.with({
            prefer_local = "node_modules/.bin",
          }),
          null_ls.builtins.diagnostics.flake8,
          
          -- Formatter
          null_ls.builtins.formatting.prettier.with({
            prefer_local = "node_modules/.bin",
          }),
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.clang_format,
        },
      })
    end,
  },
}

