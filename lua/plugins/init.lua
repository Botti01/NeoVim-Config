return require("lazy").setup({

  { "nvim-tree/nvim-web-devicons" },
  
  { "nvim-neo-tree/neo-tree.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvim-lualine/lualine.nvim" },
  { "akinsho/bufferline.nvim" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },             -- Autocompletamento
  { "jose-elias-alvarez/null-ls.nvim" }, -- Linting e formatting
  { "lewis6991/gitsigns.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },
  { "goolord/alpha-nvim", config = function() require("alpha").setup(require("alpha.themes.dashboard").opts) end },
  { "numToStr/Comment.nvim" },
  { "AckslD/nvim-neoclip.lua" },
  { "voldikss/vim-floaterm" },
  { "windwp/nvim-autopairs" },


  { "folke/tokyonight.nvim", lazy = false }, -- Tema
  
    -- Carica il tema Catppuccin
  require("plugins.colortheme"),
})

