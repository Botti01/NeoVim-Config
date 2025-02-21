# Neovim Configuration

This is my personal Neovim configuration, designed for performance, customization, and an efficient workflow. It is built using **Lazy.nvim** as the plugin manager.

## 📁 Directory Structure

\`\`\`
~/.config/nvim
├── init.lua              # Main Neovim configuration file
├── lazy-lock.json        # Plugin lockfile (automatically managed)
├── lua/
│   ├── core/             # Core configurations (keymaps, options, etc.)
│   ├── plugins/          # Plugin configurations (each plugin in a separate file)
│   ├── README.md         # This file
\`\`\`

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

---

## 🚀 Features & Plugins

### **🛠 Core Plugins**
- **[Lazy.nvim](https://github.com/folke/lazy.nvim)** - Plugin manager
- **[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)** - File explorer
- **[lualine](https://github.com/nvim-lualine/lualine.nvim)** - Status line
- **[bufferline](https://github.com/akinsho/bufferline.nvim)** - Tab management
- **[telescope](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder
- **[treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting

### **💻 LSP & Autocompletion**
- **[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)** - LSP support
- **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** - Autocompletion
- **[LuaSnip](https://github.com/L3MON4D3/LuaSnip)** - Snippets

### **🎨 UI & Theming**
- **[tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** - Colorscheme
- **[alpha-nvim](https://github.com/goolord/alpha-nvim)** - Dashboard
- **[indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim)** - Indentation guides

### **🛡️ Code Formatting & Git**
- **[null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)** - Linting & Formatting
- **[gitsigns](https://github.com/lewis6991/gitsigns.nvim)** - Git integration

### **📝 Miscellaneous**
- **[comment.nvim](https://github.com/numToStr/Comment.nvim)** - Easy commenting
- **[image.nvim](https://github.com/samodostal/image.nvim)** - Image viewer in Neovim
