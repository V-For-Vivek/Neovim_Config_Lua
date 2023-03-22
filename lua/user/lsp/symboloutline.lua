local status_ok, symbolo = pcall(require, "symbols-outline")
if not status_ok then
    return
end
symbolo.setup()
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>o", "<cmd>SymbolsOutline<CR>", opts)
