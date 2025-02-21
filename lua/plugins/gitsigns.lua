return {
  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { hl = "GitSignsAdd", text = "▌", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = { hl = "GitSignsChange", text = "▌", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
          delete = { hl = "GitSignsDelete", text = "▐", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          topdelete = { hl = "GitSignsDelete", text = "▐", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          changedelete = { hl = "GitSignsChange", text = "▌", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        },
        keymaps = {
          -- Mappature per navigare tra le modifiche
          noremap = true,
          ["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
          ["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },

          -- Altri comandi utili
          ["n <leader>hs"] = "<cmd>Gitsigns stage_hunk<CR>",  -- Stage della modifica
          ["v <leader>hs"] = ":Gitsigns stage_hunk<CR>",      -- Stage della modifica in modalità visiva
          ["n <leader>hu"] = "<cmd>Gitsigns undo_stage_hunk<CR>", -- Annulla stage
          ["n <leader>hr"] = "<cmd>Gitsigns reset_hunk<CR>",    -- Resetta la modifica
          ["n <leader>hR"] = "<cmd>Gitsigns reset_buffer<CR>",  -- Resetta tutte le modifiche del buffer
        },
        watch_index = {
          interval = 1000,
        },
        current_line_blame = true,  -- Mostra git blame sulla linea corrente
        current_line_blame_opts = {
          delay = 1000,  -- Delay per la visualizzazione del blame
        },
      })
    end,
  },
}

