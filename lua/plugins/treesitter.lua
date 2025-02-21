-- treesitter.lua

require'nvim-treesitter.configs'.setup {
  -- Abilita il supporto per le lingue desiderate
  ensure_installed = {
    "bash", "c", "cpp", "go", "lua", "python", "javascript", "typescript",
    "markdown", "gitignore", "dockerfile", "vim", "vimdoc", "json", "java", 
  },

  -- Abilita il parsing automatico per le lingue installate
  highlight = {
    enable = true,  -- Abilita l'evidenziazione della sintassi
    additional_vim_regex_highlighting = false,  -- Disabilita l'uso dell'evidenziazione regex di Vim
  },

  -- Abilita il supporto per l'indentazione automatica
  indent = {
    enable = true,  -- Abilita l'indentazione automatica
  },

  -- Configurazioni per il folding (per nascondere il codice)
  fold = {
    enable = true,  -- Abilita il folding automatico
    disable = { "python" },  -- Disabilita il folding per Python
  },

  -- Configurazioni per il rainbow parenthesis (parens colorati)
  rainbow = {
    enable = true,  -- Abilita il rainbow parenthesis
    extended_mode = true,  -- Abilita modalità estesa per più parentesi
    max_file_lines = 1000,  -- Limita il numero di linee per il rainbow (aiuta le prestazioni)
  },

  -- Configurazioni per la funzionalità di refactoring (se disponibile)
  refactor = {
    highlight_definitions = { enable = true },  -- Evidenzia le definizioni delle funzioni
    highlight_current_scope = { enable = true },  -- Evidenzia l'ambito corrente
  },
}

