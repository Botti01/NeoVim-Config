return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'saadparwaiz1/cmp_luasnip', -- Completamento tramite LuaSnip
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
          return
        end
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
  },
  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    -- Definizione delle icone personalizzate
    local kind_icons = {
      Text = '󰉿',       -- Icona per il tipo testo
      Method = 'm',      -- Icona per i metodi
      Function = '󰊕',   -- Icona per le funzioni
      Constructor = '', -- Icona per i costruttori
      Field = '',       -- Icona per i campi
      Variable = '󰆧',   -- Icona per le variabili
      Class = '󰌗',      -- Icona per le classi
      Interface = '',   -- Icona per le interfacce
      Module = '',      -- Icona per i moduli
      Property = '',    -- Icona per le proprietà
      Unit = '',        -- Icona per le unità
      Value = '󰎠',      -- Icona per i valori
      Enum = '',        -- Icona per gli enum
      Keyword = '󰌋',    -- Icona per le parole chiave
      Snippet = '',     -- Icona per gli snippet
      Color = '󰏘',      -- Icona per i colori
      File = '󰈙',       -- Icona per i file
      Reference = '',   -- Icona per i riferimenti
      Folder = '󰉋',     -- Icona per le cartelle
      EnumMember = '',  -- Icona per i membri degli enum
      Constant = '󰇽',   -- Icona per le costanti
      Struct = '',      -- Icona per le strutture
      Event = '',       -- Icona per gli eventi
      Operator = '󰆕',   -- Icona per gli operatori
      TypeParameter = '󰊄', -- Icona per i parametri di tipo
    }

    -- Configurazione di nvim-cmp
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Usa LuaSnip per espandere gli snippet
        end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },

      -- Mappature per la navigazione nel completamento
      mapping = cmp.mapping.preset.insert {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },

      -- Fonti per il completamento
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },

      -- Formattazione del completamento con le icone
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, vim_item)
          -- Imposta le icone per i vari tipi di completamento
          vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
          vim_item.menu = ({
            nvim_lsp = '[LSP]',
            luasnip = '[Snippet]',
            buffer = '[Buffer]',
            path = '[Path]',
          })[entry.source.name]
          return vim_item
        end,
      },
    }
  end,
}

