-- Configurazione base per LuaSnip
local ls = require("luasnip")           -- Alias per LuaSnip
local s = ls.snippet                    -- Crea un nuovo snippet
local t = ls.text_node                  -- Nodo di testo
local i = ls.insert_node                -- Nodo per inserimento
local fmt = require("luasnip.extras.fmt").fmt  -- Per formattare gli snippets

-- Snippets personalizzati
ls.add_snippets("c", {
  -- Snippet per un main con FreeRTOS
  s("freertos_main", fmt([[
#include <FreeRTOS.h>
#include <task.h>
#include <stdio.h>

// Task 1
void task1(void *pvParameters) {{
    for (;;) {{
        printf("Task 1 running\\n");
        vTaskDelay(pdMS_TO_TICKS({}));
    }}
}}

// Task 2
void task2(void *pvParameters) {{
    for (;;) {{
        printf("Task 2 running\\n");
        vTaskDelay(pdMS_TO_TICKS({}));
    }}
}}

int main() {{
    // Crea i task
    xTaskCreate(task1, "Task 1", configMINIMAL_STACK_SIZE, NULL, 1, NULL);
    xTaskCreate(task2, "Task 2", configMINIMAL_STACK_SIZE, NULL, 1, NULL);

    // Avvia il scheduler
    vTaskStartScheduler();

    // Non dovrebbe mai arrivare qui
    for (;;);
    return 0;
}} 
]], { i(1, "1000"), i(2, "2000") })),
  
  -- Snippet per una stampa veloce
  s("print", fmt('print("{}")', { i(1, "Hello, World!") })),
})

-- Mappature rapide per espandere snippets
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- Ricarica snippets senza riavviare Neovim
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/core/snippets.lua<CR>", { noremap = true, silent = true })

