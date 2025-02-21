return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup{
      defaults = {
        -- Impostazioni di layout
        prompt_position = "bottom",  -- La barra di ricerca si trova in basso
        prompt_prefix = " ",       -- Icona del prompt
        selection_caret = " ",     -- Icona per la selezione
        entry_prefix = "  ",        -- Prefisso dell'entry
        initial_mode = "insert",    -- Modalità iniziale (insert)
        layout_strategy = "horizontal",  -- Layout orizzontale
        layout_config = {
          horizontal = { width = 0.9, height = 0.7, preview_width = 0.5 },
          vertical = { width = 0.7, height = 0.9, preview_height = 0.5 },
        },
        mappings = {
          i = {
            ["<C-h>"] = actions.which_key,  -- Mostra le opzioni di tasti in modalità inserimento
            ["<C-u>"] = false,              -- Disabilita il comportamento di default per <C-u>
            ["<C-d>"] = false,              -- Disabilita il comportamento di default per <C-d>
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",  -- Layout a discesa per la ricerca dei file
          previewer = false,   -- Disabilita la visualizzazione in anteprima
        },
        live_grep = {
          theme = "ivy",       -- Tema tipo Ivy per la ricerca live
          previewer = false,   -- Disabilita la visualizzazione in anteprima
        },
        buffers = {
          theme = "dropdown",  -- Layout a discesa per i buffer
          previewer = false,   -- Disabilita la visualizzazione in anteprima
        },
      },
    }

    -- Mappature personalizzate per il lancio di Telescope
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Trova file" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Cerca nel contenuto" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Mostra buffer aperti" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Cerca nell'aiuto" })
  end,
}

