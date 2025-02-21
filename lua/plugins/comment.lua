return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup {
      -- Impostazioni di base
      toggler = {
        line = "<leader>/",   -- Tasto per commentare/discommentare la riga
        block = "<leader>c",  -- Tasto per commentare/discommentare il blocco
      },
      opleader = {
        line = "<leader>/",   -- Tasto per commentare/discommentare in modalità operatore
        block = "<leader>c",  -- Tasto per commentare/discommentare in modalità operatore blocco
      },
      mappings = {
        basic = true,         -- Abilita le mappature di base (linea, blocco)
        extra = true,         -- Abilita le mappature extra (toggle per selezioni)
      },
      pre_hook = nil,        -- Funzione da eseguire prima di commentare
      post_hook = nil,       -- Funzione da eseguire dopo aver commentato
    }
  end
}

