-- bufferline.lua

require("bufferline").setup({
  options = {
    -- Mostra il nome del file attivo nella barra
    numbers = "none",  -- Puoi anche usare "ordinal" o "both" per numerare i buffer
    close_command = "bdelete! %d",  -- Comando per chiudere il buffer
    right_mouse_command = "bdelete! %d",  -- Comando per chiudere il buffer con il tasto destro
    left_mouse_command = "buffer %d",  -- Comando per selezionare un buffer con il tasto sinistro
    indicator = {
      style = "icon",  -- Usa l'icona per l'indicatore di buffer attivo
      icon = "▎",  -- Puoi cambiare l'icona dell'indicatore
    },
    buffer_close_icon = "",  -- Icona per chiudere il buffer
    icon_pinned = '󰐃',
    modified_icon = "●",  -- Icona per il buffer modificato
    close_icon = "",  -- Icona di chiusura per il buffer
    left_trunc_marker = "",  -- Icona per la parte sinistra troncata
    right_trunc_marker = "",  -- Icona per la parte destra troncata
    max_name_length = 30,  -- Lunghezza massima del nome del buffer
    max_prefix_length = 15,  -- Lunghezza massima del prefisso del buffer
    tab_size = 18,  -- Larghezza della tab
    diagnostics = false,  -- Se abilitato, mostra i diagnostici accanto ai buffer
    offsets = {  -- Usa questo per creare distacchi per altre finestre (es. per Neo-tree)
      {
        filetype = "NvimTree",  -- Usa NvimTree per distaccare la barra
        text = "File Explorer",  -- Etichetta per la finestra laterale
        text_align = "center",  -- Allineamento del testo
      }
    },
    show_buffer_icons = true,  -- Mostra le icone dei buffer
    show_buffer_close_icons = true,  -- Mostra le icone di chiusura dei buffer
    show_tab_indicators = true,  -- Mostra indicatori per la tab attiva
    persist_buffer_sort = true,  -- Mantieni l'ordinamento dei buffer tra le sessioni
    separator_style = { '│', '│' }, -- | "thick" | "thin" | { 'any', 'any' }, 
  },
})

