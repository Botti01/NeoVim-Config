return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      config = function()
        require('window-picker').setup {
          filter_rules = {
            include_current_win = false,
            autoselect_one = true,
            -- filtra usando le opzioni del buffer
            bo = {
              -- se il tipo di file è uno dei seguenti, la finestra verrà ignorata
              filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
              -- se il tipo di buffer è uno dei seguenti, la finestra verrà ignorata
              buftype = { 'terminal', 'quickfix' },
            },
          },
        }
      end,
    },
  },
  config = function()
    -- Se vuoi icone per gli errori diagnostici, dovrai definirle da qualche parte:
    vim.fn.sign_define('DiagnosticSignError', { text = ' ', texthl = 'DiagnosticSignError' })
    vim.fn.sign_define('DiagnosticSignWarn', { text = ' ', texthl = 'DiagnosticSignWarn' })
    vim.fn.sign_define('DiagnosticSignInfo', { text = ' ', texthl = 'DiagnosticSignInfo' })
    vim.fn.sign_define('DiagnosticSignHint', { text = '󰌵', texthl = 'DiagnosticSignHint' })

    -- Configura NeoTree
    require('neo-tree').setup {
      close_if_last_window = false, -- Chiudi Neo-tree se è l'ultima finestra rimasta nel tab
      popup_border_style = 'rounded',
      enable_git_status = true,
      enable_diagnostics = true,
      -- enable_normal_mode_for_inputs = false,                             -- Abilita la modalità normale per le finestre di input.
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' }, -- quando si aprono i file, non usare finestre contenenti questi tipi di file o buffer
      sort_case_insensitive = false, -- utilizzato quando si ordinano file e directory nell'albero
      sort_function = nil, -- usa una funzione personalizzata per ordinare i file e le directory nell'albero
      -- sort_function = function (a,b)
      --       if a.type == b.type then
      --           return a.path > b.path
      --       else
      --           return a.type > b.type
      --       end
      --   end , -- questo ordina i file e le directory in ordine decrescente
      default_component_configs = {
        container = {
          enable_character_fade = true,
        },
        indent = {
          indent_size = 2,
          padding = 1, -- padding extra sul lato sinistro
          -- guide di indentazione
          with_markers = true,
          indent_marker = '│',
          last_indent_marker = '└',
          highlight = 'NeoTreeIndentMarker',
          -- configurazione dell'espansore, necessario per il nesting dei file
          with_expanders = nil, -- se nil e il nesting dei file è abilitato, abiliterà gli espansori
          expander_collapsed = '',
          expander_expanded = '',
          expander_highlight = 'NeoTreeExpander',
        },
        icon = {
          folder_closed = '',
          folder_open = '',
          folder_empty = '󰜌',
          -- Le seguenti due impostazioni sono solo un fallback, se usi nvim-web-devicons e configuri icone predefinite lì
          -- allora queste non verranno mai utilizzate.
          default = '*',
          highlight = 'NeoTreeFileIcon',
        },
        modified = {
          symbol = '[+]',
          highlight = 'NeoTreeModified',
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = 'NeoTreeFileName',
        },
        git_status = {
          symbols = {
            -- Tipo di cambiamento
            added = '', -- o "✚", ma questa è un'informazione ridondante se usi git_status_colors sul nome
            modified = '', -- o "", ma questa è un'informazione ridondante se usi git_status_colors sul nome
            deleted = '✖', -- questo può essere usato solo nella fonte git_status
            renamed = '󰁕', -- questo può essere usato solo nella fonte git_status
            -- Tipo di stato
            untracked = '',
            ignored = '',
            unstaged = '󰄱',
            staged = '',
            conflict = '',
          },
        },
        -- Se non vuoi usare queste colonne, puoi impostare `enabled = false` per ciascuna di esse individualmente
        file_size = {
          enabled = true,
          required_width = 64, -- larghezza minima della finestra richiesta per mostrare questa colonna
        },
        type = {
          enabled = true,
          required_width = 122, -- larghezza minima della finestra richiesta per mostrare questa colonna
        },
        last_modified = {
          enabled = true,
          required_width = 88, -- larghezza minima della finestra richiesta per mostrare questa colonna
        },
        created = {
          enabled = true,
          required_width = 110, -- larghezza minima della finestra richiesta per mostrare questa colonna
        },
        symlink_target = {
          enabled = false,
        },
      },
      -- Una lista di funzioni, ciascuna rappresentante un comando personalizzato globale
      -- che sarà disponibile in tutte le fonti (se non sovrascritto in `opts[source_name].commands`)
      -- vedi `:h neo-tree-custom-commands-global`
      commands = {},
      window = {
        position = 'left',
        width = 40,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ['<space>'] = {
            'toggle_node',
            nowait = false, -- disabilita `nowait` se hai combinazioni esistenti che iniziano con questo carattere che vuoi usare
          },
          ['<2-LeftMouse>'] = 'open',
          ['<cr>'] = 'open',
          ['<esc>'] = 'cancel', -- chiudi la finestra di anteprima o la finestra fluttuante di neo-tree
          ['P'] = { 'toggle_preview', config = { use_float = true } },
          ['l'] = 'open',
          ['S'] = 'open_split',
          ['s'] = 'open_vsplit',
          -- ["S"] = "split_with_window_picker",
          -- ["s"] = "vsplit_with_window_picker",
          ['t'] = 'open_tabnew',
          -- ["<cr>"] = "open_drop",
          -- ["t"] = "open_tab_drop",
          ['w'] = 'open_with_window_picker',
          --["P"] = "toggle_preview", -- entra in modalità anteprima, che mostra il nodo corrente senza focalizzarsi
          ['C'] = 'close_node',
          -- ['C'] = 'close_all_subnodes',
          ['z'] = 'close_all_nodes',
          --["Z"] = "expand_all_nodes",
          ['a'] = {
            'add',
            -- questo comando supporta l'espansione di parentesi in stile BASH ("x{a,b,c}" -> xa,xb,xc). vedi `:h neo-tree-file-actions` per i dettagli
            -- alcuni comandi possono prendere opzioni di configurazione opzionali, vedi `:h neo-tree-mappings` per i dettagli
            config = {
              show_path = 'none', -- "none", "relative", "absolute"
            },
          },
          ['A'] = 'add_directory', -- accetta anche l'opzione config.show_path come "add". supporta anche l'espansione di parentesi in stile BASH.
          ['d'] = 'delete',
          ['r'] = 'rename',
          ['y'] = 'copy_to_clipboard',
          ['x'] = 'cut_to_clipboard',
          ['p'] = 'paste_from_clipboard',
          ['c'] = 'copy', -- prende input di testo per la destinazione, accetta anche l'opzione config.show_path come "add":
          -- ["c"] = {
          --  "copy",
          --  config = {
          --    show_path = "none" -- "none", "relative", "absolute"
          --  }
          --}
          ['m'] = 'move', -- prende input di testo per la destinazione, accetta anche l'opzione config.show_path come "add".
          ['q'] = 'close_window',
          ['R'] = 'refresh',
          ['?'] = 'show_help',
          ['<'] = 'prev_source',
          ['>'] = 'next_source',
          ['i'] = 'show_file_details',
        },
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = false, -- quando vero, saranno visualizzati in modo diverso rispetto agli altri elementi
          hide_dotfiles = false,
          hide_gitignored = false,
         hide_by_name = {
  '.DS_Store',
  'thumbs.db',
  'node_modules',
  '__pycache__',
  '.virtual_documents',
  '.git',
  '.python-version',
  '.venv',
},
hide_by_pattern = { -- usa pattern in stile glob
  --"*.meta",
  --"*/src/*/tsconfig.json",
},
always_show = { -- rimane visibile anche se altre impostazioni normalmente lo nasconderebbero
  --".gitignored",
},
never_show = { -- rimane nascosto anche se la visibilità è attivata, questo sovrascrive always_show
  --".DS_Store",
  --"thumbs.db"
},
never_show_by_pattern = { -- usa pattern in stile glob
  --".null-ls_*",
},
},
follow_current_file = {
  enabled = false, -- Questo troverà e focalizzerà il file nel buffer attivo ogni volta che
  --                 -- il file corrente viene cambiato mentre l'albero è aperto.
  leave_dirs_open = false, -- `false` chiude le cartelle espanse automaticamente, come con `:Neotree reveal`
},
group_empty_dirs = false, -- quando è vero, le cartelle vuote vengono raggruppate insieme
hijack_netrw_behavior = 'open_default', -- disabilita netrw, l'apertura di una directory apre neo-tree
-- nella posizione specificata da window.position
-- "open_current",  -- disabilita netrw, l'apertura di una directory apre all'interno della
-- finestra come farebbe netrw, indipendentemente da window.position
-- "disabled",    -- lascia intatto netrw, neo-tree non gestisce l'apertura delle directory
use_libuv_file_watcher = false, -- Questo userà i watcher di file a livello di OS per rilevare cambiamenti
-- invece di fare affidamento sugli eventi autocmd di nvim.
window = {
  mappings = {
    ['<bs>'] = 'navigate_up',
    ['.'] = 'set_root',
    ['H'] = 'toggle_hidden',
    ['/'] = 'fuzzy_finder',
    ['D'] = 'fuzzy_finder_directory',
    ['#'] = 'fuzzy_sorter', -- ordinamento fuzzy usando l'algoritmo fzy
    -- ["D"] = "fuzzy_sorter_directory",
    ['f'] = 'filter_on_submit',
    ['<c-x>'] = 'clear_filter',
    ['[g'] = 'prev_git_modified',
    [']g'] = 'next_git_modified',
    ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
    ['oc'] = { 'order_by_created', nowait = false },
    ['od'] = { 'order_by_diagnostics', nowait = false },
    ['og'] = { 'order_by_git_status', nowait = false },
    ['om'] = { 'order_by_modified', nowait = false },
    ['on'] = { 'order_by_name', nowait = false },
    ['os'] = { 'order_by_size', nowait = false },
    ['ot'] = { 'order_by_type', nowait = false },
  },
  fuzzy_finder_mappings = { -- definisci i keymap per la finestra di popup del filtro in fuzzy_finder_mode
    ['<down>'] = 'move_cursor_down',
    ['<C-n>'] = 'move_cursor_down',
    ['<up>'] = 'move_cursor_up',
    ['<C-p>'] = 'move_cursor_up',
  },
},

commands = {}, -- Aggiungi un comando personalizzato o sovrascrivi uno globale usando lo stesso nome di funzione
},
buffers = {
  follow_current_file = {
    enabled = true, -- Questo troverà e focalizzerà il file nel buffer attivo ogni volta che
    --              -- il file corrente viene cambiato mentre l'albero è aperto.
    leave_dirs_open = false, -- `false` chiude le cartelle espanse automaticamente, come con `:Neotree reveal`
  },
  group_empty_dirs = true, -- quando è vero, le cartelle vuote vengono raggruppate insieme
  show_unloaded = true,
  window = {
    mappings = {
      ['bd'] = 'buffer_delete',
      ['<bs>'] = 'navigate_up',
      ['.'] = 'set_root',
      ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
      ['oc'] = { 'order_by_created', nowait = false },
      ['od'] = { 'order_by_diagnostics', nowait = false },
      ['om'] = { 'order_by_modified', nowait = false },
      ['on'] = { 'order_by_name', nowait = false },
      ['os'] = { 'order_by_size', nowait = false },
      ['ot'] = { 'order_by_type', nowait = false },
    },
  },
},
git_status = {
  window = {
    position = 'float',
    mappings = {
      ['A'] = 'git_add_all',
      ['gu'] = 'git_unstage_file',
      ['ga'] = 'git_add_file',
      ['gr'] = 'git_revert_file',
      ['gc'] = 'git_commit',
      ['gp'] = 'git_push',
      ['gg'] = 'git_commit_and_push',
      ['o'] = { 'show_help', nowait = false, config = { title = 'Order by', prefix_key = 'o' } },
      ['oc'] = { 'order_by_created', nowait = false },
      ['od'] = { 'order_by_diagnostics', nowait = false },
      ['om'] = { 'order_by_modified', nowait = false },
      ['on'] = { 'order_by_name', nowait = false },
      ['os'] = { 'order_by_size', nowait = false },
      ['ot'] = { 'order_by_type', nowait = false },
    },
  },
},
}

vim.cmd [[nnoremap \ :Neotree reveal<cr>]]
vim.keymap.set('n', '<leader>e', ':Neotree toggle position=left<CR>', { noremap = true, silent = true }) -- focus file explorer
vim.keymap.set('n', '<leader>ngs', ':Neotree float git_status<CR>', { noremap = true, silent = true }) -- open git status window

