return {
  -- Plugin per la gestione della clipboard
  "AckslD/nvim-neoclip.lua",
  config = function()
    require("neoclip").setup {
      history = 1000,  -- Numero massimo di voci nella cronologia
      enable_persistent_history = true,  -- Abilita la storia persistente
      default_register = '"',  -- Registro predefinito per la clipboard
    }
  end,

  -- Plugin per l'integrazione con il terminale Neovim
  "voldikss/vim-floaterm",
  config = function()
    vim.g.floaterm_border = "double"  -- Imposta il tipo di bordo del terminale flottante
    vim.g.floaterm_width = 0.8  -- Larghezza del terminale flottante
    vim.g.floaterm_height = 0.8  -- Altezza del terminale flottante
    vim.g.floaterm_autoclose = 1  -- Chiude automaticamente il terminale al termine
  end,

  -- Plugin per l'autocompletamento delle parentesi
  "windwp/nvim-autopairs",
  config = function()
    require("nvim-autopairs").setup {
      check_ts = true,  -- Controlla se è un albero di sintassi
      enable_check_bracket_line = false,  -- Disabilita il controllo delle parentesi sulla stessa riga
    }
  end,
}

