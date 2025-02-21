# Neovim Configuration

Questo repository contiene la mia configurazione personalizzata per Neovim, basata su **Lazy.nvim** per la gestione dei plugin.

## 📌 Caratteristiche principali
- **Lazy.nvim** per la gestione efficiente dei plugin.
- **Telescope** per la ricerca avanzata di file e contenuti.
- **Treesitter** per un parsing avanzato del codice.
- **LSP (Language Server Protocol)** per un supporto avanzato alla programmazione.
- **Auto-completamento** con **nvim-cmp**.
- **Linting & Formatting** con **null-ls**.
- **Dashboard personalizzato** con **alpha-nvim**.
- **Tema personalizzato** (Catppuccin/Tokyonight).

## 🚀 Installazione

### 1️⃣ Clonare la configurazione
```bash
# Assicurati di avere Neovim installato
rm -rf ~/.config/nvim  # (Opzionale) Rimuove la configurazione esistente

git clone https://github.com/username/neovim-config.git ~/.config/nvim
```

### 2️⃣ Avviare Neovim e installare i plugin
Apri Neovim ed esegui:
```vim
:Lazy sync
```

## 🔧 Struttura della Configurazione
```
~/.config/nvim/
├── init.lua           # File principale di configurazione
├── lua/
│   ├── plugins/       # Cartella con i plugin separati per file
│   ├── core/          # Configurazioni di base
│   ├── mappings.lua   # Mappature personalizzate
│   ├── options.lua    # Impostazioni di Neovim
```

## 📜 Plugin Principali
- **UI & Tema**: lualine, bufferline, tokyonight
- **Navigazione**: telescope, nvim-tree
- **Editing**: Treesitter, Comment.nvim, indent-blankline
- **LSP & Completamento**: nvim-lspconfig, nvim-cmp, luasnip
- **Utilities**: gitsigns, alpha-nvim, image.nvim

## 📌 Personalizzazione
Puoi modificare la configurazione dei plugin modificando i file in `lua/plugins/`.

## 🛠 Aggiornamenti
Per aggiornare la configurazione:
```bash
cd ~/.config/nvim
git pull
nvim
:Lazy sync
```


