return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    -- Impostazioni di base
    require("indent_blankline").setup {
      char = "┆",  -- Carattere per le linee di indentazione
      char_highlight = "LineNr",     -- Colore delle linee di indentazione
      show_first_indent_level = false, -- Non mostrare le linee di indentazione per il primo livello
      use_treesitter = true,         -- Usa treesitter per l'analisi del codice
      show_trailing_blankline_indent = false, -- Non mostrare linee sulle righe vuote
      filetype_exclude = {           -- Escludi alcuni tipi di file
        "help", "dashboard", "NvimTree", "packer", "markdown"
      },
    }
  end
}

