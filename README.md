# Neovim Configuration

This is my personal Neovim configuration, designed for performance, customization, and an efficient workflow. It is built using **Lazy.nvim** as the plugin manager.

## 📁 Directory Structure

```
~/.config/nvim/
├── init.lua                     # Main Neovim configuration file
├── lazy-lock.json               # Plugin lockfile (automatically managed)
├── structurelua.txt             # Notes on the configuration structure
├── lua/
│   ├── core/                    # Core configurations
│   │   ├── options.lua          # General options
│   │   ├── keymaps.lua          # Key mappings
│   │   ├── snippets.lua         # Snippets
│   ├── plugins/                 # Individually configured plugins
│   │   ├── init.lua             # Lazy.nvim management
│   │   ├── neotree.lua          # Neo-tree configuration
│   │   ├── colortheme.lua       # Color theme
│   │   ├── bufferline.lua       # Bufferline
│   │   ├── lualine.lua          # Lualine
│   │   ├── treesitter.lua       # Treesitter
│   │   ├── telescope.lua        # Telescope
│   │   ├── lsp.lua              # LSP
│   │   ├── autocompletion.lua   # Autocompletion
│   │   ├── none-ls.lua          # Null-ls (linting and formatting)
│   │   ├── gitsigns.lua         # Gitsigns
│   │   ├── alpha.lua            # Alpha Dashboard
│   │   ├── indent-blankline.lua # Indentation lines
│   │   ├── comment.lua          # Comment plugin
│   │   ├── image.lua            # Image viewer
│   │   └── misc.lua             # Miscellaneous plugins
│   ├── README.md                # This file
```

## 🔧 Installation

### **1️⃣ Clone the Repository**
First, make sure you have **Neovim (>= 0.9)** installed. Then, clone this repository into your Neovim configuration folder:

\`\`\`bash
git clone https://github.com/your-username/neovim-config.git ~/.config/nvim
\`\`\`

### **2️⃣ Open Neovim**
Launch Neovim and Lazy.nvim will automatically install the plugins:

\`\`\`bash
nvim
\`\`\`

### **3️⃣ Restart Neovim**
After the installation is complete, restart Neovim to apply all configurations.
