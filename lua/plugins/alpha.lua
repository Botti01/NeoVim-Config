return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Impostazione delle sezioni dell'header
    dashboard.section.header.val = {
      [[                                                    ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                    ]],
    }

    -- Definisci i bottoni della dashboard
    dashboard.buttons = {
      dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recently Used Files", ":Telescope oldfiles<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Footer di benvenuto
    dashboard.section.footer.val = "Benvenuto in Neovim!"

    -- Applicare la configurazione
    alpha.setup(dashboard.opts)
  end,
}

