return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local on_attach = function(client, bufnr)
      -- Abilita le funzionalità di completamento e altre configurazioni
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts) -- Vai alla definizione
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts) -- Vai all'implementazione
      vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts) -- Vai ai riferimenti
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts) -- Mostra il tooltip
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts) -- Rinomina
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts) -- Azioni di codice
    end

    -- Configurazione LSP per diversi linguaggi
    local servers = { "pyright", "tsserver", "clangd", "gopls", "html", "cssls" }
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      })
    end

    -- Configurazione per il completamento con nvim-cmp
    local cmp = require("cmp")
    cmp.setup({
      mapping = {
        ["<C-Space>"] = cmp.mapping.complete(),  -- Attiva completamento
        ["<CR>"] = cmp.mapping.confirm({ select = true }),  -- Conferma completamento
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "cmdline" },
      },
    })
  end,
}

