-- colortheme.lua
return {
  "catppuccin/nvim", 
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",  -- Tema scuro preferito
      background = {
        light = "latte",  -- Tema chiaro
        dark = "mocha",   -- Tema scuro
      },
    })
    vim.cmd("colorscheme catppuccin")  -- Applica il tema Catppuccin
  end
}

