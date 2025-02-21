-- Imposta il leader key su spazio
vim.g.mapleader = " "          -- Leader key principale
vim.g.maplocalleader = " "     -- Leader key locale

local keymap = vim.keymap.set  -- Alias per semplificare il codice
local opts = { noremap = true, silent = true } -- Opzioni generali per le mappature

-- Modalità normale (n)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)     -- Apri/chiudi NvimTree
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts) -- Cerca file
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)  -- Cerca testo nei file
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)    -- Mostra i buffer aperti
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)  -- Cerca nella documentazione

-- Salva e chiudi
keymap("n", "<C-s>", ":w<CR>", opts)  -- Salva con Ctrl+s in modalità normale
keymap("i", "<C-s>", "<Esc>:w<CR>a", opts)  -- Salva con Ctrl+s in modalità inserimento
keymap("n", "<leader>q", ":q<CR>", opts)                  -- Chiudi Neovim
keymap("n", "<leader>Q", ":q!<CR>", opts)                 -- Chiudi forzatamente

-- Navigazione tra finestre
keymap("n", "<C-h>", "<C-w>h", opts)                      -- Vai a sinistra
keymap("n", "<C-l>", "<C-w>l", opts)                      -- Vai a destra
keymap("n", "<C-j>", "<C-w>j", opts)                      -- Vai in basso
keymap("n", "<C-k>", "<C-w>k", opts)                      -- Vai in alto

-- Navigazione tra buffer
keymap("n", "<S-l>", ":bnext<CR>", opts)                  -- Vai al buffer successivo
keymap("n", "<S-h>", ":bprevious<CR>", opts)              -- Vai al buffer precedente

-- Modalità inserimento (i)
keymap("i", "jk", "<ESC>", opts)                          -- Esci dalla modalità inserimento con "jk"

-- Modalità visuale (v)
keymap("v", "<", "<gv", opts)                             -- Indenta a sinistra e rimani in visuale
keymap("v", ">", ">gv", opts)                             -- Indenta a destra e rimani in visuale

-- Modalità comando (c)
keymap("c", "w!!", "w !sudo tee % >/dev/null", opts)      -- Salva un file con permessi di root

-- Modalità terminale (t)
keymap("t", "<Esc>", "<C-\\><C-n>", opts)                 -- Esci dalla modalità terminale


