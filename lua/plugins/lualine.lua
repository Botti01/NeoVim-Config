-- lualine.lua

require("lualine").setup({
  options = {
    icons_enabled = true,  -- Abilita le icone
    theme = "catppuccin",  -- Imposta il tema di lualine su Catppuccin
    component_separators = { left = "", right = "" },  -- Separatori tra i componenti
    section_separators = { left = "", right = "" },  -- Separatori tra le sezioni
    disabled_filetypes = { "dashboard", "packer" },  -- Disabilita la barra di stato in alcuni file
    always_divide_middle = true,  -- Dividi sempre la barra di stato in due metà
  },
  sections = {
    -- Sezione A: Mostra la modalità (normale, inserimento, etc.) con un'icona personalizzata
    lualine_a = { 
      'mode',
      fmt = function(str)
        return ' ' .. str  -- Aggiungi un'icona prima della modalità
      end,
    },
    -- Sezione B: Mostra il ramo git
    lualine_b = { 'branch' },
    -- Sezione C: Mostra il nome del file
    lualine_c = { 
      'filename',
      file_status = true,  -- Mostra lo stato del file (readonly, modificato, etc.)
      path = 0,  -- 0 = solo nome del file, 1 = percorso relativo, 2 = percorso assoluto
    },
    -- Sezione X: Diagnostica, differenze, codifica e tipo di file
    lualine_x = {
      'diagnostics',  -- Mostra gli errori e gli avvisi
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
      colored = false,
      update_in_insert = false,
      always_visible = false,
      cond = function() return vim.fn.winwidth(0) > 100 end,  -- Mostra la diagnostica solo se la finestra è abbastanza larga
      -- Mostra le differenze (aggiunto, modificato, rimosso)
      { 'diff',
        symbols = { added = ' ', modified = ' ', removed = ' ' },
        cond = function() return vim.fn.winwidth(0) > 100 end,
      },
      { 'encoding', cond = function() return vim.fn.winwidth(0) > 100 end },
      { 'filetype', cond = function() return vim.fn.winwidth(0) > 100 end },
    },
    -- Sezione Y: Mostra la posizione del cursore (riga e colonna)
    lualine_y = { 'location' },
    -- Sezione Z: Mostra il progresso (percentuale)
    lualine_z = { 'progress' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } },  -- Mostra il percorso relativo del file
    lualine_x = { { 'location', padding = 0 } },  -- Mostra la posizione con nessun padding
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = { 'fugitive' },
})

