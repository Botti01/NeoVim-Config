-- Abilita i numeri di riga
vim.opt.number = true           -- Mostra i numeri di riga
vim.opt.relativenumber = true   -- Numeri relativi (utile per movimenti veloci)

-- Impostazioni di tabulazione e indentazione
vim.opt.tabstop = 4             -- Spazi visualizzati per un tab
vim.opt.shiftwidth = 4          -- Spazi per la pressione di <Tab>
vim.opt.expandtab = true        -- Usa spazi invece di tab
vim.opt.smartindent = true      -- Indentazione intelligente basata sul contesto

-- Migliora la ricerca
vim.opt.ignorecase = true       -- Ignora maiuscole/minuscole nella ricerca
vim.opt.smartcase = true        -- Ma considera maiuscole se presenti nel termine di ricerca
vim.opt.incsearch = true        -- Mostra i risultati mentre digiti

-- Miglioramenti visivi
vim.opt.termguicolors = true    -- Abilita i colori GUI
vim.opt.cursorline = false       -- Evidenzia la riga corrente
vim.opt.signcolumn = "yes"      -- Colonna per simboli (diagnostica, ecc.)

-- Clipboard e copia/incolla
vim.opt.clipboard = "unnamedplus" -- Usa la clipboard di sistema per copia/incolla

-- File e salvataggio
vim.opt.undofile = true         -- Abilita il file di undo persistente
vim.opt.backup = false          -- Disabilita i file di backup
vim.opt.writebackup = false     -- Non crea backup temporanei

-- Interfaccia e prestazioni
vim.opt.splitright = true       -- Nuovi split verticali a destra
vim.opt.splitbelow = true       -- Nuovi split orizzontali in basso
vim.opt.updatetime = 300        -- Aggiorna più velocemente (utile per diagnosi)

-- Scorrimento
vim.opt.scrolloff = 8           -- Mantieni 8 righe visibili sopra/sotto durante lo scorrimento
vim.opt.sidescrolloff = 8

